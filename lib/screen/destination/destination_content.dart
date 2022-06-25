import 'package:booktrip/constant.dart';
import 'package:booktrip/models/model_destinasi.dart';
import 'package:booktrip/repository/repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class destinationCard extends StatefulWidget {
  const destinationCard({
    Key? key,
  }) : super(key: key);

  @override
  State<destinationCard> createState() => _destinationCardState();
}

class _destinationCardState extends State<destinationCard> {
  Repository repository = Repository();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Destinasi>>(
        stream: repository.getDataDestinasi(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("ERROR");
          } else if (snapshot.hasData) {
            final destinasi = snapshot.data;
            return Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(kDefaultPadding,
                    kDefaultPadding / 2, kDefaultPadding, kDefaultPadding / 2),
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: destinasi!.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 5,
                                  offset: Offset(
                                      1, 4), // changes position of shadow
                                ),
                              ],
                              image: DecorationImage(
                                  image:
                                      AssetImage(destinasi[index].itemAdress),
                                  fit: BoxFit.cover)),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                bottom: 0, top: 182, left: 8),
                            child: Text(
                              destinasi[index].itemTitle,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18),
                            ),
                          ),
                        ),
                      );
                    }),
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
