import 'package:booktrip/screen/destination/detail/components/imageAndicons.dart';
import 'package:booktrip/screen/destination/detail/components/titleAndprice.dart';
import 'package:flutter/material.dart';

class BodyDetail extends StatelessWidget {
  const BodyDetail(
      {Key? key,
      required this.image,
      required this.title,
      required this.destination,
      required this.detail,
      required this.price})
      : super(key: key);
  final String image, title, destination, detail, price;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          ImageAndIcons(size: size, image: image),
          TitleAndPrice(
              title: title,
              price: price,
              destination: destination,
              detail: detail)
        ],
      ),
    );
  }
}
