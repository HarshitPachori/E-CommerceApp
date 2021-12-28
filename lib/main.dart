import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/components/horizontal_listview.dart';
import 'package:e_commerce/my_drawer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget imageCorousel = Container(
      height: 200,
      child: CarouselSlider(
        items: const [
          // Image(
          //   fit: BoxFit.cover,
          //   image: AssetImage("images/1.jpg"),
          // ),
          // Image(
          //   fit: BoxFit.cover,
          //   image: AssetImage("images/2.jpg"),
          // ),
          // Image(
          //   fit: BoxFit.cover,
          //   image: AssetImage("images/3.jpg"),
          // ),
          Image(
            fit: BoxFit.cover,
            image: AssetImage("images/4.jpg"),
          ),
          Image(
            fit: BoxFit.cover,
            image: AssetImage("images/5.jpg"),
          ),
          Image(
            fit: BoxFit.cover,
            image: AssetImage("images/6.jpg"),
          ),
          // Image(
          //   fit: BoxFit.cover,
          //   image: AssetImage("images/7.jpg"),
          // ),
          Image(
            fit: BoxFit.cover,
            image: AssetImage("images/8.jpg"),
          ),
          // Image(
          //   fit: BoxFit.cover,
          //   image: AssetImage("images/9.jpg"),
          // ),
        ],
        options: CarouselOptions(
          height: 250,
          autoPlayCurve: Curves.fastOutSlowIn,
          autoPlay: true,
          aspectRatio: 5.0,
          enlargeStrategy: CenterPageEnlargeStrategy.height,
          enlargeCenterPage: true,
          scrollDirection: Axis.horizontal,
        ),
      ),
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
              IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
              const SizedBox(
                width: 10,
              ),
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {},
              ),
              const SizedBox(
                width: 5,
              )
            ],
          ),
        ),
        drawer: const MyDrawer(),
        body: ListView(
          children: [
            imageCorousel,
            const Padding(
              padding: EdgeInsets.all(8),
              child: Text("Categories"),
            ),
           const HorizontalList(),
          ],
        ));
  }
}
