import 'package:e_commerce/Services/user_services.dart';
import 'package:e_commerce/pages/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:glassmorphism/glassmorphism.dart';

class RegsiterPage extends StatefulWidget {
  const RegsiterPage({Key? key}) : super(key: key);

  @override
  _RegsiterPageState createState() => _RegsiterPageState();
}

class _RegsiterPageState extends State<RegsiterPage> {
  bool obscureText = true;
  final _formKey = GlobalKey<FormState>();
  FirebaseAuth auth = FirebaseAuth.instance;
  final UserServices _userServices = UserServices();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> moveToHome() async {
    if (_formKey.currentState!.validate()) {
      try {
        await auth
            .createUserWithEmailAndPassword(
                email: _emailController.text,
                password: _passwordController.text)
            .then((value) => {
              Fluttertoast.showToast(msg: "User created successfully"),
                  _userServices.createUserData({
                    "uid": value.user!.uid,
                    "username": _nameController.text,
                    "email": value.user!.email,
                  }),
                  if (value != null)
                    {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()))
                    }
                })
            .catchError((err) => {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(err))),
                });
      } on FirebaseAuthException catch (e) {
        if (e.code == 'email-already-in-use') {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Email is already in use ")));
        } else if (e.code == 'invalid-email') {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text("Invalid Email")));
        } else if (e.code == 'week-password') {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Password is to week")));
        } else if (e.code == 'operation-not-allowed') {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("This operation is not allowed here ")));
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
             Image.asset("assets/images/7.jpg",height: double.infinity,width: double.infinity,fit: BoxFit.cover,),
            const SizedBox(
              height: 100,
            ),
            SafeArea(
              child: Center(
                child: SingleChildScrollView(
                  child: GlassmorphicContainer(
                    blur: 20,
                    borderRadius: 20,
                    linearGradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomRight,
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
                          vertical: 50.0, horizontal: 32.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            Text(
                              "Register here ",
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.8),
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              keyboardType: TextInputType.name,
                              controller: _nameController,
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(0.0),
                                labelText: 'Name',
                                hintText: 'Enter full name',
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
                                  return "name cannot be empty";
                                }
                                return null;
                              },
                              onChanged: (value) {
                                setState(() {});
                              },
                            ),
                            const SizedBox(
                              height: 20,
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
                            const SizedBox(
                              height: 40,
                            ),
                            MaterialButton(
                              onPressed: () async {
                                await moveToHome();
                              },
                              height: 45,
                              color: Colors.black.withOpacity(0.6),
                              child: const Text(
                                "Create Account",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16.0),
                              ),
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
