import 'package:e_commerce/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails(
      {Key? key,
      this.productDetailName,
      this.productDetailNewPrice,
      this.productDetailOldPrice,
      this.productDetailPicture})
      : super(key: key);

  final Object? productDetailName;
  final Object? productDetailNewPrice;
  final Object? productDetailOldPrice;
  final Object? productDetailPicture;

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
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
            InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const HomePage()));
                },
                child: const Text("FashApp")),
            IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          ],
        ),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 300,
            child: GridTile(
              child: Container(
                color: Colors.white,
                child: Image.asset("${widget.productDetailPicture}"),
              ),
              footer: Container(
                child: ListTile(
                  leading: Text(
                    "${widget.productDetailName}",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  title: Row(
                    children: [
                      Expanded(
                        child: Text(
                          "${widget.productDetailOldPrice}",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough),
                        ),
                      ),
                      Expanded(
                          child: Text(
                        "${widget.productDetailNewPrice}",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.red),
                      )),
                    ],
                  ),
                ),
                color: Colors.white70,
              ),
            ),
          ),

          // *************first buttons****************
          Row(
            children: [
              // ========the size button ============
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text("Size"),
                            content: const Text("Choose the size"),
                            actions: [
                              MaterialButton(
                                onPressed: () {
                                  Navigator.of(context).pop(context);
                                },
                                child: const Text("Close"),
                              )
                            ],
                          );
                        });
                  },
                  color: Colors.white,
                  textColor: Colors.grey,
                  elevation: 0.2,
                  child: Row(
                    children: const [
                      Expanded(
                        child: Text("Size"),
                      ),
                      Expanded(
                        child: Icon(Icons.arrow_drop_down),
                      ),
                    ],
                  ),
                ),
              ),
              // ========the size button ============
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text("Color"),
                            content: const Text("Choose a Color"),
                            actions: [
                              MaterialButton(
                                onPressed: () {
                                  Navigator.of(context).pop(context);
                                },
                                child: const Text("Close"),
                              )
                            ],
                          );
                        });
                  },
                  color: Colors.white,
                  textColor: Colors.grey,
                  elevation: 0.2,
                  child: Row(
                    children: const [
                      Expanded(
                        child: Text("Color"),
                      ),
                      Expanded(
                        child: Icon(Icons.arrow_drop_down),
                      ),
                    ],
                  ),
                ),
              ),
              // ========the size button ============
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text("Quantity"),
                            content: const Text("Choose the Quantity"),
                            actions: [
                              MaterialButton(
                                onPressed: () {
                                  Navigator.of(context).pop(context);
                                },
                                child: const Text("Close"),
                              )
                            ],
                          );
                        });
                  },
                  color: Colors.white,
                  textColor: Colors.grey,
                  elevation: 0.2,
                  child: Row(
                    children: const [
                      Expanded(
                        child: Text("Qty."),
                      ),
                      Expanded(
                        child: Icon(Icons.arrow_drop_down),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          // *************Second buttons****************
          Row(
            children: [
              // ========the size button ============
              Expanded(
                child: MaterialButton(
                  onPressed: () {},
                  color: Colors.red,
                  textColor: Colors.white,
                  elevation: 0.2,
                  child: const Text("Buy now"),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.add_shopping_cart,
                  color: Colors.red,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.favorite_border,
                  color: Colors.red,
                ),
              ),
            ],
          ),
          const Divider(),
          const ListTile(
            title: Text("Product details"),
            subtitle: Text(
                "It is a blazer with best quality of material used . It is very comfortable . "),
          ),
          const Divider(),
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(12, 5, 5, 5),
                child: Text(
                  "Product Name ",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text("${widget.productDetailName}"),
              ),
            ],
          ),
          Row(
            children: const [
              Padding(
                padding: EdgeInsets.fromLTRB(12, 5, 5, 5),
                child: Text(
                  "Product Brand ",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              // Remember to  create the product brand
              Padding(
                padding: EdgeInsets.all(5.0),
                child: Text("brand x"),
              ),
            ],
          ),
          Row(
            children: const [
              Padding(
                padding: EdgeInsets.fromLTRB(12, 5, 5, 5),
                child: Text(
                  "Product Condition ",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              // Remeber to create the product the product condtion
              Padding(
                padding: EdgeInsets.all(5.0),
                child: Text("New "),
              ),
            ],
          ),
          const Divider(),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Similar Products"),
          ),
          // Similar Products Section
          const SizedBox(
            height: 340.0,
            child: SimilarProducts(),
          )
        ],
      ),
    );
  }
}

class SimilarProducts extends StatefulWidget {
  const SimilarProducts({Key? key}) : super(key: key);

  @override
  _SimilarProductsState createState() => _SimilarProductsState();
}

class _SimilarProductsState extends State<SimilarProducts> {
  var productList = [
    {
      "name": "Men's Blazer",
      "picture": "assets/images/16.jpeg",
      "old_price": 120,
      "price": 85,
    },
    {
      "name": "Heals",
      "picture": "assets/images/11.jpeg",
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
          return SimilarSingleProd(
            productName: productList[index]["name"],
            productPicture: productList[index]["picture"],
            productOldPrice: productList[index]["old_price"],
            productPrice: productList[index]["price"],
          );
        });
  }
}

class SimilarSingleProd extends StatelessWidget {
  final Object? productName;
  final Object? productPicture;
  final Object? productOldPrice;
  final Object? productPrice;

  const SimilarSingleProd(
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
        tag: "$productName",
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
      ),
    );
  }
}
