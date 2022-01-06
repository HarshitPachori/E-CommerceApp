import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/components/horizontal_listview.dart';
import 'package:e_commerce/components/products.dart';
import 'package:e_commerce/my_drawer.dart';
import 'package:e_commerce/pages/authentication.dart';
import 'package:e_commerce/pages/cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget imageCorousel = CarouselSlider(
      items: const [
        Image(
          fit: BoxFit.cover,
          image: AssetImage("images/2.jpeg"),
        ),
        Image(
          fit: BoxFit.cover,
          image: AssetImage("images/3.jpeg"),
        ),
        Image(
          fit: BoxFit.cover,
          image: AssetImage("images/4.jpeg"),
        ),
        Image(
          fit: BoxFit.cover,
          image: AssetImage("images/24.jpg"),
        ),
        Image(
          fit: BoxFit.cover,
          image: AssetImage("images/25.jpg"),
        ),
        Image(
          fit: BoxFit.cover,
          image: AssetImage("images/26.jpg"),
        ),
        Image(
          fit: BoxFit.cover,
          image: AssetImage("images/27.jpg"),
        ),
      ],
      options: CarouselOptions(
          height: 220,
          autoPlayCurve: Curves.fastOutSlowIn,
          autoPlay: true,
          enlargeCenterPage: true,
          scrollDirection: Axis.horizontal,
          enlargeStrategy: CenterPageEnlargeStrategy.scale),
    );

    return Scaffold(
        appBar: AppBar(
          systemOverlayStyle:
              const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
          centerTitle: true,
          backgroundColor: Colors.red,
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("FashApp"),
              const SizedBox(
                width: 110,
              ),
              IconButton(
                  onPressed: () {
                    signOutGoogle();
                  },
                  icon: const Icon(Icons.search)),
              const SizedBox(
                width: 10,
              ),
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const ShoppingCart()));
                },
              ),
              const SizedBox(
                width: 5,
              )
            ],
          ),
        ),
        drawer: const MyDrawer(),
        body: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            //image caroudel
            imageCorousel,
            const SizedBox(
              height: 15,
            ),
            const Padding(
              padding: EdgeInsets.all(8),
              child: Text("Categories",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18)),
            ),

            const HorizontalList(),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                alignment: Alignment.centerLeft,
                child: const Text(
                  "Recent Products",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                ),
              ),
            ),
            const Flexible(child: Products()),
          ],
        ));
  }
}
