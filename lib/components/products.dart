import 'package:e_commerce/pages/product_details.dart';
import 'package:flutter/material.dart';

class Products extends StatefulWidget {
  const Products({Key? key}) : super(key: key);

  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var productList = [
    {
      "name": "Men's Blazer",
      "picture": "images/16.jpeg",
      "old_price": 120,
      "price": 85,
    },
    {
      "name": "Red dress",
      "picture": "images/14.jpeg",
      "old_price": 100,
      "price": 50,
    },
    {
      "name": "Women' Blazer",
      "picture": "images/15.jpeg",
      "old_price": 100,
      "price": 50,
    },
    {
      "name": "Black Dress",
      "picture": "images/13.jpeg",
      "old_price": 100,
      "price": 50,
    },
    {
      "name": "Heals",
      "picture": "images/11.jpeg",
      "old_price": 100,
      "price": 50,
    },
    {
      "name": "Trouser",
      "picture": "images/10.jpeg",
      "old_price": 100,
      "price": 50,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: productList.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: SingleProd(
              productName: productList[index]["name"],
              productPicture: productList[index]["picture"],
              productOldPrice: productList[index]["old_price"],
              productPrice: productList[index]["price"],
            ),
          );
        });
  }
}

class SingleProd extends StatelessWidget {
  final productName;
  final productPicture;
  final productOldPrice;
  final productPrice;

  const SingleProd(
      {Key? key,
      this.productName,
      this.productPicture,
      this.productOldPrice,
      this.productPrice})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Hero(
        tag: productName,
        child: Material(
          child: InkWell(
            // here we are passing the value of product to theproduct etails page
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ProductDetails(
                      productDetailName: productName,
                      productDetailNewPrice: productPrice,
                      productDetailPicture: productPicture,
                      productDetailOldPrice: productOldPrice,
                    ))),
            child: GridTile(
              footer: Container(
                color: Colors.white,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        productName,
                        style: TextStyle(
                            color: Colors.grey.shade800,
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0),
                      ),
                    ),
                    Text(
                      "$productPrice",
                      style: const TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              child: Image.asset(
                productPicture,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}