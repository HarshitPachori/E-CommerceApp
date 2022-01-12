import 'package:e_commerce/pages/homepage.dart';
import 'package:e_commerce/pages/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

bool isLoggedIn = false;

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    isLoggedIn = false;
    super.initState();
  }

  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(fontFamily: GoogleFonts.poppins().fontFamily),
        home: (user != null) ? const HomePage() : const LoginPage());
  }
}
