import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/components/horizontal_listview.dart';
import 'package:e_commerce/components/products.dart';
import 'package:e_commerce/components/my_drawer.dart';
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
          fit: BoxFit.fill,
          image: AssetImage("assets/images/1.jpeg"),
        ),
        Image(
          fit: BoxFit.cover,
          image: AssetImage("assets/images/2.jpeg"),
        ),
        Image(
          fit: BoxFit.cover,
          image: AssetImage("assets/images/3.jpeg"),
        ), Image(
          fit: BoxFit.cover,
          image: AssetImage("assets/images/4.jpeg"),
        ),

      ],
      options: CarouselOptions(
          height: 200,
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
          backgroundColor: Colors.teal,
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Shopify"),
              const SizedBox(
                width: 100,
              ),
              IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
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
              height: 5,
            ),
  Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
              child: Container(
                alignment: Alignment.topLeft,
                child: const Text("Categories",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),),
              ),
            ),

            const HorizontalList(),
              imageCorousel,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
              child: Container(
                alignment: Alignment.topLeft,
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
