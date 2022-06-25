import 'package:booktrip/constant.dart';
import 'package:booktrip/screen/destination/destination.dart';
import 'package:booktrip/screen/home/body.dart';
import 'package:booktrip/screen/timeline/timeline.dart';
import 'package:flutter/material.dart';

import 'orderhistory/orderhistory.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  final screens = const [
    Body(),
    destination(),
    timeline(),
    order(),
  ];

  @override
  Widget build(BuildContext context) {
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
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.menu,
              color: Colors.white,
            ),
            iconSize: 40,
          )
        ],
      ),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.location_on), label: 'Destination'),
          BottomNavigationBarItem(
              icon: Icon(Icons.view_timeline_outlined), label: 'Timeline'),
          BottomNavigationBarItem(
              icon: Icon(Icons.history), label: 'Order History')
        ],
      ),
    );
  }
}
