import 'package:booktrip/screen/home_screen.dart';
import 'package:flutter/material.dart';

class Payments extends StatelessWidget {
  const Payments({Key? key}) : super(key: key);
  static const routeAdr = "/payment";

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
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
              automaticallyImplyLeading: false),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                  image:
                      AssetImage("assets/icons/Successful purchase-pana.png")),
              TextButton(
                style: TextButton.styleFrom(
                  textStyle:
                      const TextStyle(fontSize: 16, color: Color(0xFF2196F3)),
                ),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                      (route) => false);
                },
                child: const Text('Comeback To Homepage'),
              ),
            ],
          )),
    );
  }
}
