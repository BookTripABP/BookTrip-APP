import 'package:booktrip/constant.dart';
import 'package:booktrip/screen/components/recommendDestination.dart';
import 'package:booktrip/screen/components/review.dart';
import 'package:booktrip/screen/components/titlewithmore.dart';
import 'package:flutter/material.dart';
import '../components/featuredTimeline.dart';
import '../components/header_with_searchbar.dart';
import '../components/titlewitoutmore.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          HeaderWithSearchBar(size: size),
          titleWithMore(
            title: 'Recommend',
          ),
          recommendTopDestination(),
          titleWithMore(
            title: 'Timeline',
          ),
          featuredTimeline(),
          titlewithoutmore(title: "Feedbacks"),
          review_user()
        ],
      ),
    );
  }
}
