import 'package:booktrip/constant.dart';
import 'package:flutter/material.dart';

class titlewithoutmore extends StatelessWidget {
  const titlewithoutmore({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
              padding: EdgeInsets.only(
                  left: kDefaultPadding,
                  top: kDefaultPadding / 2,
                  bottom: kDefaultPadding)),
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
