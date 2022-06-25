import 'package:booktrip/models/model_destinasi.dart';
import 'package:booktrip/repository/repository.dart';
import 'package:flutter/material.dart';

import '../../constant.dart';

class recommendTopDestination extends StatelessWidget {
  const recommendTopDestination({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Repository repository = Repository();
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: StreamBuilder<List<Destinasi>>(
          stream: repository.getDataDestinasi(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text("ERROR");
            } else if (snapshot.hasData) {
              final destinasi = snapshot.data;
              return Row(
                children: [
                  recommendDestination(
                      image: destinasi![0].itemAdress,
                      title: destinasi[0].itemTitle),
                  recommendDestination(
                      image: destinasi[1].itemAdress,
                      title: destinasi[1].itemTitle),
                  recommendDestination(
                      image: destinasi[2].itemAdress,
                      title: destinasi[2].itemTitle),
                  recommendDestination(
                      image: destinasi[3].itemAdress,
                      title: destinasi[3].itemTitle),
                  recommendDestination(
                      image: destinasi[4].itemAdress,
                      title: destinasi[4].itemTitle),
                ],
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}

class recommendDestination extends StatelessWidget {
  const recommendDestination({
    Key? key,
    required this.image,
    required this.title,
  }) : super(key: key);

  final String image, title;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(
          left: kDefaultPadding,
          top: kDefaultPadding / 2,
          bottom: kDefaultPadding),
      width: size.width * 0.4,
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover)),
      child: Column(
        children: [
          Container(
            height: size.height / 3.5,
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.all(kDefaultPadding / 2),
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                    offset: Offset(0, 5),
                    blurRadius: 10,
                    color: Theme.of(context).primaryColor.withOpacity(0.25)),
              ]),
              child: Row(
                children: [
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: "$title\n", style: TextStyle(color: kTextColor)),
                    TextSpan(
                        text: "Lombok",
                        style: TextStyle(color: kTextColor.withOpacity(0.5))),
                  ])),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
