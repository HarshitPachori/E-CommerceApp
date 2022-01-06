import 'package:flutter/material.dart';

class CartProducts extends StatefulWidget {
  const CartProducts({Key? key}) : super(key: key);

  @override
  _CartProductsState createState() => _CartProductsState();
}

class _CartProductsState extends State<CartProducts> {
  var productsOnTheCart = [
    {
      "name": "Men's Blazer",
      "picture": "images/16.jpeg",
      "price": 85,
      "size": "M",
      "color": "Red",
      "Quantity": 1,
    },
    {
      "name": "Red dress",
      "picture": "images/14.jpeg",
      "price": 115,
      "size": "S",
      "color": "Red",
      "Quantity": 1,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: productsOnTheCart.length,
        itemBuilder: (context, index) {
          return SingleCartProducts(
            cartprodName: productsOnTheCart[index]["name"],
            cartprodColor: productsOnTheCart[index]["color"],
            cartprodPicture: productsOnTheCart[index]["picture"],
            cartprodPrice: productsOnTheCart[index]["price"],
            cartprodQuantity: productsOnTheCart[index]["Quantity"],
            cartprodSize: productsOnTheCart[index]["size"],
          );
        });
  }
}

class SingleCartProducts extends StatelessWidget {
  final cartprodName;
  final cartprodPicture;

  final cartprodPrice;
  final cartprodSize;
  final cartprodColor;
  final cartprodQuantity;

  const SingleCartProducts(
      {Key? key,
      this.cartprodName,
      this.cartprodPicture,
      this.cartprodPrice,
      this.cartprodSize,
      this.cartprodColor,
      this.cartprodQuantity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      child: ListTile(
        isThreeLine: true,

        // leading section
        leading: Image.asset(
          cartprodPicture,
          fit: BoxFit.cover,
        ),
        title: Text(cartprodName),

        trailing: Column(
          children: [
            Expanded(
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.arrow_drop_up),
              ),
            ),
            Text("$cartprodQuantity"),
            Expanded(
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.arrow_drop_down),
              ),
            ),
          ],
        ),
        subtitle: Column(
          children: [
            Row(
              // Size of the product
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Size:"),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    cartprodSize,
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(12.0, 8.0, 8.0, 8.0),
                  child: Text("Color:"),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    cartprodColor,
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
              ],
            ),
            // price of product
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                "$cartprodPrice",
                style: const TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
              ),
            )
          ],
        ),
      ),
    );
  }

 
}
