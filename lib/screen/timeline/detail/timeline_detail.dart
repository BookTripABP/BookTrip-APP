import 'package:booktrip/constant.dart';
import 'package:booktrip/screen/timeline/detail/components/titlewWithImage.dart';
import 'package:flutter/material.dart';

class timelineDetail extends StatelessWidget {
  final String address;
  final String title;
  final String detail;
  const timelineDetail(
      {Key? key,
      required this.address,
      required this.title,
      required this.detail})
      : super(key: key);

  static const routeAdr = '/timelineDetail';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          centerTitle: true,
          title: Text(
            'BookTrip',
            style: TextStyle(
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: titleAndimage(
            title: title, size: size, address: address, detail: detail));
  }
}
