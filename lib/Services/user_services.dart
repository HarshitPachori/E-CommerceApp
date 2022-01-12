import 'package:firebase_database/firebase_database.dart';

class UserServices {
  final DatabaseReference reference = FirebaseDatabase.instance.ref();
  createUserData(Map value) {
    reference.child("users").set(value);
  }
}
