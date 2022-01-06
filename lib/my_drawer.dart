
import 'package:e_commerce/pages/authentication.dart';
import 'package:e_commerce/pages/login_page.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text(" Harshit Pachori"),
            accountEmail: const Text(" harshitpachori345@gmail.com"),
            currentAccountPicture: GestureDetector(
              child: const CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.person),
              ),
            ),
            decoration: const BoxDecoration(color: Colors.red),
          ),
          InkWell(
            onTap: () {},
            child: const ListTile(
              title: Text("Home Page"),
              leading: Icon(
                Icons.home,
                color: Colors.red,
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: const ListTile(
              title: Text("My Account"),
              leading: Icon(
                Icons.person,
                color: Colors.red,
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: const ListTile(
              title: Text("My Orders"),
              leading: Icon(
                Icons.shopping_basket,
                color: Colors.red,
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: const ListTile(
              title: Text("Shopping Cart"),
              leading: Icon(
                Icons.shopping_cart,
                color: Colors.red,
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: const ListTile(
              title: Text("Favourites"),
              leading: Icon(
                Icons.favorite,
                color: Colors.red,
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
