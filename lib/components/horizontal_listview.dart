import 'package:flutter/material.dart';

class HorizontalList extends StatelessWidget {
  const HorizontalList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          Category(imageLocation: "images/17.png", imageCaption: "T-shirt"),
          Category(imageLocation: "images/22.png", imageCaption: "Dress"),
          Category(imageLocation: "images/19.png", imageCaption: "Jeans"),
          Category(imageLocation: "images/21.png", imageCaption: "Formal"),
          Category(imageLocation: "images/20.png", imageCaption: "Casual"),
          Category(imageLocation: "images/18.png", imageCaption: "Shoes"),
          Category(imageLocation: "images/23.png", imageCaption: "Accesories"),
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  const Category(
      {Key? key, required this.imageLocation, required this.imageCaption})
      : super(key: key);
  final String imageLocation;
  final String imageCaption;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: SizedBox(
        width: 110,
        child: ListTile(
          title: Image(
            image: AssetImage(imageLocation),
            fit: BoxFit.cover,
          ),
          subtitle: Container(
              alignment: Alignment.topCenter,
              child: Text(
                imageCaption,
                style: const TextStyle(
                    fontSize: 15.0, fontWeight: FontWeight.w600),
              )),
        ),
      ),
    );
  }
}
