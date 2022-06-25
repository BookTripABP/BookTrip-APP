import 'package:booktrip/constant.dart';
import 'package:booktrip/screen/destination/destination_content.dart';
import 'package:flutter/material.dart';

import '../components/header_with_searchbar.dart';

class destination extends StatelessWidget {
  const destination({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          HeaderWithSearchBar(size: size),
          SizedBox(height: 4),
          destinationCard(),
        ],
      ),
    );
  }
}
