import 'package:flutter/material.dart';

class HorizontalList extends StatelessWidget {
  const HorizontalList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          Category(
              imageLocation: "assets/images/apparel.png", imageCaption: "T-shirt"),
          Category(
              imageLocation: "assets/images/icon-8.png", imageCaption: "Dress"),
          Category(
              imageLocation: "assets/images/icon-9.png", imageCaption: "Jeans"),
          Category(
              imageLocation: "assets/images/icon-10.png", imageCaption: "Formal"),
          Category(
              imageLocation: "assets/images/icon-12.png", imageCaption: "Casual"),
          Category(
              imageLocation: "assets/images/beauty.png", imageCaption: "Shoes"),
          Category(
              imageLocation: "assets/images/icon-9.png",
              imageCaption: "Accessories"),
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
        width: 100,
        child: ListTile(
          title: Image(
            image: AssetImage(imageLocation),
            fit: BoxFit.fill,
          ),
          subtitle: Container(
              alignment: Alignment.topCenter,
              child: Text(
                imageCaption,
                style: const TextStyle(
                    fontSize: 14.0, fontWeight: FontWeight.w600),
              )),
        ),
      ),
    );
  }
}
