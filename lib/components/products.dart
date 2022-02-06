import 'package:e_commerce/components/product_details.dart';
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
      "picture": "assets/images/blazer.png",
      "old_price": 120,
      "price": 85,
    },
    {
      "name": "Red dress",
      "picture": "assets/images/reddress.png",
      "old_price": 100,
      "price": 50,
    },
    {
      "name": "Women' Blazer",
      "picture": "assets/images/15.jpeg",
      "old_price": 100,
      "price": 50,
    },
    {
      "name": "Black Dress",
      "picture": "assets/images/shirt1.png",
      "old_price": 100,
      "price": 50,
    },
    {
      "name": "Heals",
      "picture": "assets/images/heals.png",
      "old_price": 100,
      "price": 50,
    },
    {
      "name": "Trouser",
      "picture": "assets/images/10.jpeg",
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
  final Object? productName;
  final Object? productPicture;
  final Object? productOldPrice;
  final Object? productPrice;

  const SingleProd(
      {Key? key,
      this.productName,
      this.productPicture,
      this.productOldPrice,
      this.productPrice})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Card(

        elevation: 10,
        child: Hero(

          tag: "$productName",

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
                  footer: Card(
                    color: Colors.white,
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            "$productName",
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
                    "$productPicture",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
          ),



    );
  }
}
