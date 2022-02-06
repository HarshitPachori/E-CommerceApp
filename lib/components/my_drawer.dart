import 'dart:ui';

import 'package:e_commerce/Services/authentication.dart';
import 'package:e_commerce/pages/admin_page.dart';
import 'package:e_commerce/pages/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user =FirebaseAuth.instance.currentUser!;
    return Drawer(
      backgroundColor: Colors.teal.shade100,
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName:  Text(user.displayName.toString(),style: TextStyle(fontWeight: FontWeight.w600),),
            accountEmail:  Text(user.email.toString(),style: TextStyle(fontWeight: FontWeight.w600)),
            currentAccountPicture: GestureDetector(
              child:  Container(
               
               decoration:  BoxDecoration(borderRadius: BorderRadius.circular(40),image: DecorationImage(image: NetworkImage(user.photoURL.toString(),),fit: BoxFit.cover),),
                
              ),
            ),
            decoration: const BoxDecoration(color: Colors.teal),
          ),
          InkWell(
            onTap: () {},
            child:  ListTile(
              title: const Text("Home Page"),
              leading: Icon(
                Icons.home,
                color: Colors.teal.shade700,
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child:  ListTile(
              title: const Text("My Account"),
              leading: Icon(
                Icons.person,
                color: Colors.teal.shade700,
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child:  ListTile(
              title: const Text("My Orders"),
              leading: Icon(
                Icons.shopping_basket,
                color: Colors.teal.shade700,
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child:  ListTile(
              title: const Text("Shopping Cart"),
              leading: Icon(
                Icons.shopping_cart,
                color: Colors.teal.shade700,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const AdminPage()));
            },
            child:  ListTile(
              title: const Text("Favourites"),
              leading: Icon(
                Icons.favorite,
                color: Colors.teal.shade700,
              ),
            ),
          ),
          const Divider(),
          InkWell(
            onTap: () {},
            child: const ListTile(
              title: Text("Settings"),
              leading: Icon(
                Icons.settings,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              signOutGoogle();
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const LoginPage()));
            },
            child: const ListTile(
              title: Text("Logout"),
              leading: Icon(
                Icons.person_remove,
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: const ListTile(
              title: Text("About"),
              leading: Icon(
                Icons.info,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
