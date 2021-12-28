import 'package:flutter/material.dart';

class HorizontalList extends StatelessWidget {
  const HorizontalList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          Category(
              imageLocation:
                  "https://img.icons8.com/external-kiranshastry-lineal-kiranshastry/2x/fa314a/external-tshirt-man-accessories-kiranshastry-lineal-kiranshastry.png",
              imageCaption: "T-shirt"),
          Category(
              imageLocation:
                  "https://img.icons8.com/external-photo3ideastudio-lineal-photo3ideastudio/2x/fa314a/external-dress-travel-checklist-photo3ideastudio-lineal-photo3ideastudio.png",
              imageCaption: "T-shirt"),
          Category(
              imageLocation:
                  "https://img.icons8.com/ios/2x/fa314a/womens-suit.png",
              imageCaption: "T-shirt"),
          Category(
              imageLocation:
                  "https://img.icons8.com/ios/2x/fa314a/womens-suit.png",
              imageCaption: "T-shirt"),
          Category(
              imageLocation:
                  "https://img.icons8.com/ios/2x/fa314a/womens-suit.png",
              imageCaption: "T-shirt"),
          Category(
              imageLocation:
                  "https://img.icons8.com/ios/2x/fa314a/womens-suit.png",
              imageCaption: "T-shirt"),
          Category(
              imageLocation:
                  "https://img.icons8.com/ios/2x/fa314a/womens-suit.png",
              imageCaption: "T-shirt"),
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
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: InkWell(
        onTap: () {},
        child: Container(
          width: 100,
          child: ListTile(
            title: Image(
              image: NetworkImage(imageLocation),
            ) ,           subtitle: Container(
                alignment: Alignment.topCenter,
                child: Text(
                  imageCaption,
                )),
          ),
        ),
      ),
    );
  }
}
