import 'package:flutter/material.dart';
import 'package:booktrip/constant.dart';

import 'iconCards.dart';

class ImageAndIcons extends StatelessWidget {
  const ImageAndIcons({Key? key, required this.size, required this.image})
      : super(key: key);

  final Size size;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: kDefaultPadding + 8),
      child: SizedBox(
        height: size.height * 0.5,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                children: <Widget>[
                  IconCard(icon: "assets/icons/icons8-plane-100.png"),
                  IconCard(
                      icon: "assets/icons/icons8-ticket-confirmed-100.png"),
                  IconCard(icon: "assets/icons/icons8-hotel-star-100.png"),
                  IconCard(icon: "assets/icons/icons8-tour-guide-60.png"),
                ],
              ),
            ),
            Container(
              height: size.height * 0.5,
              width: size.width * 0.7,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(8),
                ),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 5),
                      blurRadius: 10,
                      color: Theme.of(context).primaryColor.withOpacity(0.25)),
                ],
                image: DecorationImage(
                  alignment: Alignment.centerLeft,
                  fit: BoxFit.fill,
                  image: AssetImage(image),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
