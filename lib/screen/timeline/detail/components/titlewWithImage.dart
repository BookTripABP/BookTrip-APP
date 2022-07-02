import 'package:booktrip/constant.dart';
import 'package:flutter/material.dart';

class titleAndimage extends StatefulWidget {
  const titleAndimage({
    Key? key,
    required this.title,
    required this.size,
    required this.address,
    required this.detail,
  }) : super(key: key);

  final String title;
  final Size size;
  final String address;
  final String detail;

  @override
  State<titleAndimage> createState() => _titleAndimageState();
}

class _titleAndimageState extends State<titleAndimage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: const EdgeInsets.only(
            bottom: kDefaultPadding + 8,
            left: kDefaultPadding,
            right: kDefaultPadding,
            top: kDefaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: TextStyle(
                  fontWeight: FontWeight.w600, fontSize: 20, color: kTextColor),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              height: widget.size.height / 3.5,
              width: widget.size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 5),
                      blurRadius: 10,
                      color: Theme.of(context).primaryColor.withOpacity(0.25)),
                ],
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(widget.address),
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              widget.detail,
              style: TextStyle(
                  color: kTextColor, fontSize: 16, fontWeight: FontWeight.w400),
            )
          ],
        ),
      ),
    );
  }
}
