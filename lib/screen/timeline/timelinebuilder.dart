import 'package:booktrip/constant.dart';
import 'package:booktrip/models/model_timeline.dart';
import 'package:booktrip/repository/repository.dart';
import 'package:booktrip/screen/timeline/detail/timeline_detail.dart';
import 'package:flutter/material.dart';

class timeline_builder extends StatefulWidget {
  timeline_builder({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  State<timeline_builder> createState() => _timeline_builderState();
}

class _timeline_builderState extends State<timeline_builder> {
  Repository repository = Repository();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Timeline>>(
        stream: repository.getDataTimeline(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("ERROR");
          } else if (snapshot.hasData) {
            final timeline = snapshot.data;
            return Expanded(
              child: ListView.builder(
                  itemCount: timeline!.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(
                          kDefaultPadding,
                          kDefaultPadding / 2,
                          kDefaultPadding,
                          kDefaultPadding / 2),
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, timelineDetail.routeAdr,
                                  arguments: timelineDetail(
                                    address: timeline[index].itemAdress,
                                    title: timeline[index].itemTitle,
                                    detail: timeline[index].itemDetail,
                                  ));
                            },
                            child: Container(
                              height: widget.size.height / 4,
                              width: widget.size.width,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  image: DecorationImage(
                                      image: AssetImage(
                                          timeline[index].itemAdress),
                                      fit: BoxFit.fill)),
                            ),
                          ),
                          Container(
                            width: widget.size.width,
                            height: 32,
                            decoration:
                                BoxDecoration(color: Colors.white, boxShadow: [
                              BoxShadow(
                                  offset: Offset(0, 5),
                                  blurRadius: 10,
                                  color: Theme.of(context)
                                      .primaryColor
                                      .withOpacity(0.25)),
                            ]),
                            child: Padding(
                              padding:
                                  const EdgeInsets.all(kDefaultPadding / 4),
                              child: Text(
                                timeline[index].itemTitle,
                                style:
                                    TextStyle(color: kTextColor, fontSize: 18),
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  }),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
