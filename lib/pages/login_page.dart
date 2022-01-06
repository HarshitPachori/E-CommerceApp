import 'package:e_commerce/pages/authentication.dart';
import 'package:e_commerce/pages/homepage.dart';
import 'package:e_commerce/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton = false;

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
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
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400,
                        ),
                        hintStyle: const TextStyle(
                          color: Colors.grey,
                          fontSize: 14.0,
                        ),
                        prefixIcon: const Icon(
                          CupertinoIcons.person,
                          color: Colors.black,
                          size: 18,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey.shade200, width: 2),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        floatingLabelStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.black, width: 1.5),
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
                      obscureText: true,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(0.0),
                        labelText: 'Password',
                        hintText: 'Password',
                        hintStyle: const TextStyle(
                          color: Colors.grey,
                          fontSize: 14.0,
                        ),
                        labelStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400,
                        ),
                        prefixIcon: const Icon(
                          CupertinoIcons.lock,
                          color: Colors.black,
                          size: 18,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey.shade200, width: 2),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        floatingLabelStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.black, width: 1.5),
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
                          child: const Text(
                            'Forgot Password?',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14.0,
                                fontWeight: FontWeight.w400),
                          ),
                        )
                      ],
                    ),
                    MaterialButton(
                      onPressed: () async {
                        await moveToHome();
                      },
                      height: 45,
                      color: Colors.black,
                      child: const Text(
                        "Login",
                        style: TextStyle(color: Colors.white, fontSize: 16.0),
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
                              color: Colors.grey.shade600,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const RegsiterPage()));
                          },
                          child: const Text(
                            'Register',
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 14.0,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ],
                    ),
                    const Divider(),
                    const Text("OR"),
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
                                  builder: (context) => const HomePage()));
                        });
                      },
                      height: 45,
                      color: Colors.black,
                      child: Row(children: const [
                        Icon(
                          FontAwesomeIcons.google,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Login with Google",
                          style: TextStyle(color: Colors.white, fontSize: 16.0),
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
            )
          ],
        ),
      ),
    );
  }
}
