import 'package:booktrip/models/model_timeline.dart';
import 'package:booktrip/repository/repository.dart';
import 'package:flutter/material.dart';
import 'package:booktrip/screen/timeline/detail/timeline_detail.dart';

import '../../constant.dart';

class featuredTimeline extends StatelessWidget {
  const featuredTimeline({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Repository repository = Repository();
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: StreamBuilder<List<Timeline>>(
          stream: repository.getDataTimeline(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text("ERROR");
            } else if (snapshot.hasData) {
              final timeline = snapshot.data;
              return Column(
                children: [
                  featuredTimelineCard(
                    image: timeline![0].itemAdress,
                    title: timeline[0].itemTitle,
                    index: 0,
                  ),
                  featuredTimelineCard(
                    image: timeline[1].itemAdress,
                    title: timeline[1].itemTitle,
                    index: 1,
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

class featuredTimelineCard extends StatelessWidget {
  const featuredTimelineCard(
      {Key? key, required this.image, required this.title, required this.index})
      : super(key: key);
  final String image;
  final String title;
  final int index;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Repository repository = Repository();
    return StreamBuilder<List<Timeline>>(
        stream: repository.getDataTimeline(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("ERROR");
          } else if (snapshot.hasData) {
            final timeline = snapshot.data;
            return Container(
              margin: EdgeInsets.only(
                left: kDefaultPadding,
                right: kDefaultPadding,
                top: kDefaultPadding / 2,
                bottom: kDefaultPadding / 2,
              ),
              width: size.width,
              child: Column(
                children: [
                  Image(
                    image: AssetImage(image),
                    width: size.width,
                    height: size.width / 2,
                    fit: BoxFit.fill,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, timelineDetail.routeAdr,
                          arguments: timelineDetail(
                            address: timeline![index].itemAdress,
                            title: timeline[index].itemTitle,
                            detail: timeline[index].itemDetail,
                          ));
                    },
                    child: Container(
                      padding: EdgeInsets.all(kDefaultPadding / 4),
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
                                style: TextStyle(
                                    color: kTextColor,
                                    fontWeight: FontWeight.w500)),
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
