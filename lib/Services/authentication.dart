import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

Future<String> signInWithGoogle() async {
  try {
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();
    if (googleSignInAccount == null) {
      return "User Doesnt exists";
    }
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    final UserCredential authresult =
        await _auth.signInWithCredential(credential);

    final User? user = authresult.user;
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final QuerySnapshot collectuser = await FirebaseFirestore.instance
        .collection("users")
        .where("uid", isEqualTo: authresult.user!.uid)
        .get();

    List<DocumentSnapshot> documents = collectuser.docs;
    if (documents.isEmpty) {
      FirebaseFirestore.instance
          .collection("users")
          .doc(authresult.user!.uid)
          .set({
        "uid": authresult.user!.uid,
        "username": authresult.user!.displayName,
        "email": authresult.user!.email,
        "profilePicture": authresult.user!.photoURL,
      });
      final DatabaseReference ref = FirebaseDatabase.instance.ref();
      ref.child("users").set({
        "uid": authresult.user!.uid,
        "username": authresult.user!.displayName,
        "email": authresult.user!.email,
      });

      prefs.setString("uid", authresult.user!.uid);
      prefs.setString("username", authresult.user!.displayName!);

      prefs.setString("profilePicture", authresult.user!.photoURL!);
    } else {
      await prefs.setString("uid", documents[0]["uid"]);
      await prefs.setString("username", documents[0]["username"]);

      await prefs.setString("profilePicture", documents[0]["profilePicture"]);
    }

    return "SignInWithGoogle succeeded : $user";
  } on FirebaseAuthException catch (e) {
    AlertDialog(
      content: Text(e.code),
    );
    rethrow;
  }
}

void signOutGoogle() async {
  await googleSignIn.signOut();
  await _auth.signOut();
}
