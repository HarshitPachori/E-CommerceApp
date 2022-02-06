import 'package:e_commerce/Services/authentication.dart';
import 'package:e_commerce/pages/homepage.dart';
import 'package:e_commerce/pages/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:glassmorphism/glassmorphism.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";

  bool obscureText = true;

  final _formKey = GlobalKey<FormState>();
  FirebaseAuth auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> moveToHome() async {
    if (_formKey.currentState!.validate()) {
      try {
        await auth
            .signInWithEmailAndPassword(
                email: _emailController.text,
                password: _passwordController.text)
            .then((value) {
          Fluttertoast.showToast(msg: "User Signed in successfully");
          if (value != null) {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const HomePage()));
          }
        });
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("User not found with that email")));
        } else if (e.code == 'wrong-password') {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Wrong password provided for that user.")));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Something went wrong ")));
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
        toolbarHeight: 0,
      ),
      body: Center(
        child: Stack(
          children: <Widget>[
            // Image.network(
            //   "https://images.unsplash.com/photo-1513094735237-8f2714d57c13?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=435&q=80",
            //   fit: BoxFit.cover,
            //   height: double.infinity,
            //   width: double.infinity,
            //   scale: 1,
            // ),
            Image.asset(
              "assets/images/7.jpg",
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.cover,
            ),

            // const SizedBox(
            //   height: 100,
            // ),
            SafeArea(
              child: Center(
                child: SingleChildScrollView(
                  child: GlassmorphicContainer(
                    blur: 20,
                    borderRadius: 20,
                    linearGradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          const Color(0xFFffffff).withOpacity(0.5),
                          const Color(0xFFFFFFFF).withOpacity(0.5),
                        ],
                        stops: const [
                          0.1,
                          1,
                        ]),
                    borderGradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        const Color(0xFFffffff).withOpacity(0.5),
                        const Color((0xFFFFFFFF)).withOpacity(0.5),
                      ],
                    ),
                    border: 2,
                    height: 510,
                    width: 350,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 32.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Welcome here",
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.8),
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              controller: _emailController,
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(0.0),
                                labelText: 'Email',
                                hintText: 'Username or e-mail',
                                labelStyle: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w400,
                                ),
                                hintStyle: TextStyle(
                                  color: Colors.grey.shade300,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15.0,
                                ),
                                prefixIcon: const Icon(
                                  CupertinoIcons.person,
                                  color: Colors.black,
                                  size: 19,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey.shade200, width: 1.5),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                floatingLabelStyle: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.0,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.black, width: 1.5),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "username cannot be empty";
                                }
                                return null;
                              },
                              onChanged: (value) {
                                name = value;
                                setState(() {});
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              keyboardType: TextInputType.visiblePassword,
                              controller: _passwordController,
                              cursorColor: Colors.black,
                              obscureText: obscureText,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(0.0),
                                labelText: 'Password',
                                hintText: 'Password',
                                hintStyle: TextStyle(
                                  color: Colors.grey.shade300,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15.0,
                                ),
                                labelStyle: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w400,
                                ),
                                prefixIcon: const Icon(
                                  CupertinoIcons.lock,
                                  color: Colors.black,
                                  size: 19,
                                ),
                                suffixIcon: InkWell(
                                    onTap: () {
                                      setState(() {
                                        obscureText = false;
                                      });
                                    },
                                    onDoubleTap: () {
                                      setState(() {
                                        obscureText = true;
                                      });
                                    },
                                    child: const Icon(
                                      CupertinoIcons.eye_fill,
                                      color: Colors.grey,
                                    )),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey.shade200, width: 1.5),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                floatingLabelStyle: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.0,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.black, width: 1.5),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Password cannot be empty";
                                } else if (value.length < 5) {
                                  return "Password lemngth should be atleast 6";
                                }
                                return null;
                              },
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Forgot Password?',
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.6),
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w600,
                                        decoration: TextDecoration.underline),
                                  ),
                                )
                              ],
                            ),
                            MaterialButton(
                              onPressed: () async {
                                await moveToHome();
                              },
                              height: 45,
                              color: Colors.black.withOpacity(0.6),
                              child: const Text(
                                "Login",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16.0),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Don\'t have an account?',
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.6),
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w600),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const RegsiterPage()));
                                  },
                                  child: Text(
                                    'Register',
                                    style: TextStyle(
                                        color: Colors.blue.shade700,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w600,
                                        decoration: TextDecoration.underline),
                                  ),
                                ),
                              ],
                            ),
                            Text("OR",
                                style: TextStyle(
                                  color: Colors.black.withOpacity(0.6),
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600,
                                )),
                            const SizedBox(
                              height: 10,
                            ),
                            MaterialButton(
                              onPressed: () {
                                signInWithGoogle().whenComplete(() {
                                  setState(() {});
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const HomePage()));
                                });
                              },
                              height: 45,
                              color: Colors.black.withOpacity(0.6),
                              child: Row(children: const [
                                Icon(
                                  FontAwesomeIcons.google,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Login with Google",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16.0),
                                ),
                              ]),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
