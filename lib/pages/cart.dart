import 'package:e_commerce/components/cart_products.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ShoppingCart extends StatefulWidget {
  const ShoppingCart({Key? key}) : super(key: key);

  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
        centerTitle: true,
        backgroundColor: Colors.red,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              width: 15,
            ),
            const Text("Cart"),
            IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          ],
        ),
      ),
      body: const CartProducts(),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Row(
          children: [
            const Expanded(
              child: ListTile(
                title: Text("Total:"),
                subtitle: Text("\$230"),
              ),
            ),
            Expanded(
                child: MaterialButton(
                    onPressed: () {},
                    child: const Text(
                      "Check Out",
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.red)),
          ],
        ),
      ),
    );
  }
}
