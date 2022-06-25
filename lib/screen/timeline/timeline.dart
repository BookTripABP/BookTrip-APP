import 'package:booktrip/screen/timeline/timelinebuilder.dart';
import 'package:flutter/material.dart';

import '../../constant.dart';
import '../components/header_with_searchbar.dart';

class timeline extends StatelessWidget {
  const timeline({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        HeaderWithSearchBar(size: size),
        timeline_builder(
          size: size,
        ),
      ],
    );
  }
}
