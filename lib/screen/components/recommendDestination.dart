import 'package:booktrip/models/model_destinasi.dart';
import 'package:booktrip/repository/repository.dart';
import 'package:booktrip/screen/destination/detail/destination_detail.dart';
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
                    title: destinasi[0].itemTitle,
                    index: 0,
                  ),
                  recommendDestination(
                    image: destinasi[11].itemAdress,
                    title: destinasi[11].itemTitle,
                    index: 11,
                  ),
                  recommendDestination(
                    image: destinasi[13].itemAdress,
                    title: destinasi[13].itemTitle,
                    index: 13,
                  ),
                  recommendDestination(
                    image: destinasi[14].itemAdress,
                    title: destinasi[14].itemTitle,
                    index: 14,
                  ),
                  recommendDestination(
                    image: destinasi[15].itemAdress,
                    title: destinasi[15].itemTitle,
                    index: 15,
                  ),
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
    required this.index,
  }) : super(key: key);

  final String image, title;
  final int index;

  @override
  Widget build(BuildContext context) {
    Repository repository = Repository();
    Size size = MediaQuery.of(context).size;
    return StreamBuilder<List<Destinasi>>(
        stream: repository.getDataDestinasi(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("ERROR");
          } else if (snapshot.hasData) {
            final destinasi = snapshot.data;
            return Container(
              margin: EdgeInsets.only(
                  left: kDefaultPadding,
                  top: kDefaultPadding / 2,
                  bottom: kDefaultPadding),
              width: size.width * 0.4,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(image), fit: BoxFit.cover)),
              child: Column(
                children: [
                  Container(
                    height: size.height / 3.5,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, destinationDetail.routeAdr,
                          arguments: destinationDetail(
                              address: destinasi![index].itemAdress,
                              title: destinasi[index].itemTitle,
                              destination: destinasi[index].itemDestination,
                              detail: destinasi[index].itemDetail,
                              harga: destinasi[index].itemHarga));
                    },
                    child: Container(
                      padding: EdgeInsets.all(kDefaultPadding / 2),
                      decoration:
                          BoxDecoration(color: Colors.white, boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 5),
                            blurRadius: 10,
                            color: Theme.of(context)
                                .primaryColor
                                .withOpacity(0.25)),
                      ]),
                      child: Row(
                        children: [
                          RichText(
                              text: TextSpan(children: [
                            TextSpan(
                                text: "$title\n",
                                style: TextStyle(color: kTextColor)),
                            TextSpan(
                                text: "Lombok",
                                style: TextStyle(
                                    color: kTextColor.withOpacity(0.5))),
                          ])),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
