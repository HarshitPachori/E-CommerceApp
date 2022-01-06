import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/pages/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  late SharedPreferences preferences;
  bool loading = false;
  bool isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    isSignedIn();
  }

  void isSignedIn() async {
    setState(() {
      loading = true;
    });
    preferences = await SharedPreferences.getInstance();
    isLoggedIn = await googleSignIn.isSignedIn();
    if (isLoggedIn) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
    }
    setState(() {
      loading = false;
    });
  }

  Future<String> handleSignIn() async {
    preferences = await SharedPreferences.getInstance();
    setState(() {
      loading = true;
    });
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleUser!.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken);
    final UserCredential authResult =
        await firebaseAuth.signInWithCredential(credential);
    if (authResult != null) {
      final QuerySnapshot result = await FirebaseFirestore.instance
          .collection("users")
          .where("id", isEqualTo: authResult.user!.uid)
          .get();
      final List<DocumentSnapshot> docs = result.docs;
      if (docs.isEmpty) {
        // insert the user to our collection
        FirebaseFirestore.instance
            .collection("users")
            .doc(authResult.user!.uid)
            .set({
          "id": authResult.user!.uid,
          "username": authResult.user!.displayName,
          "profilePicture": authResult.user!.photoURL
        });
        await preferences.setString("id", authResult.user!.uid);
        await preferences.setString("username", authResult.user!.displayName!);
        await preferences.setString(
            "profilePicture", authResult.user!.photoURL!);
      } else {
        await preferences.setString("id", docs[0]["id"]);
        await preferences.setString("username", docs[0]["username"]);
        await preferences.setString(
            "profilePicture", docs[0]["profilePicture"]);
      }
      Fluttertoast.showToast(msg: "Sign in successful");
      setState(() {
        loading = false;
      });
    } else {
      Fluttertoast.showToast(msg: "Login Failed  ");
    }

    return "Signed In ";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: Center(
        child: ElevatedButton(
            onPressed: () {
              handleSignIn();
            },
            child: const Text("Sign in with google ")),
      ),
    );
  }
}
