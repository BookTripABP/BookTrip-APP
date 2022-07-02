import 'package:booktrip/screen/destination/detail/body.dart';
import 'package:flutter/material.dart';

class destinationDetail extends StatelessWidget {
  final String address;
  final String title;
  final String destination;
  final String detail;
  final String harga;
  const destinationDetail(
      {Key? key,
      required this.address,
      required this.title,
      required this.destination,
      required this.detail,
      required this.harga})
      : super(key: key);
  static const routeAdr = '/destinationDetail';

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
        body: BodyDetail(
          image: address,
          destination: destination,
          detail: detail,
          price: harga,
          title: title,
        ));
  }
}
