import 'dart:ui';

import 'package:booktrip/constant.dart';
import 'package:booktrip/models/model_user.dart';
import 'package:booktrip/repository/repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../models/model_destinasi.dart';
import '../components/header_with_searchbar.dart';

class order extends StatefulWidget {
  const order({Key? key}) : super(key: key);

  @override
  State<order> createState() => _orderState();
}

class _orderState extends State<order> {
  final user = FirebaseAuth.instance.currentUser;
  Users? loggedInUser;
  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      loggedInUser = Users.fromJson(value.data()!);
      order = loggedInUser!.order!;
      getOrderHistory();
      setState(() {});
    });
    getDestinasi();
    setState(() {});
  }

  List<Destinasi> orderHistory = [];
  List<Destinasi> destinasi = [];

  List order = [];

  QuerySnapshot? _tempData;

  void getDestinasi() async {
    _tempData =
        await FirebaseFirestore.instance.collection('destination').get();
    for (int i = 0; i < _tempData!.docs.length; i++) {
      destinasi.add(Destinasi.fromJson(_tempData!.docs[i]));
    }
    setState(() {});
  }

  void getOrderHistory() {
    for (int i = 0; i < order.length; i++) {
      final suggestions = destinasi.where((element) {
        final destinasiName = element.itemDestination;
        final input = order[i];

        return destinasiName.contains(input);
      }).toList();
      setState(() => orderHistory.add(suggestions.first));
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        HeaderWithSearchBar(size: size),
        if (orderHistory.isEmpty)
          Column(
            children: [
              SizedBox(
                height: 56,
              ),
              Text(
                "There Is No Order History Yet",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: kDefaultPadding,
                    right: kDefaultPadding,
                    top: 20,
                    bottom: 20),
                child: Container(
                  width: MediaQuery.of(context).size.width / 1.5,
                  child: Image(
                      image: AssetImage(
                          "assets/icons/Ecommerce campaign-bro.png")),
                ),
              ),
            ],
          )
        else if (orderHistory.isNotEmpty)
          Expanded(
            child: ListView.builder(
                itemCount: orderHistory.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(
                        kDefaultPadding, 4, kDefaultPadding, 0),
                    child: Card(
                      elevation: 4,
                      child: ListTile(
                        title: Text(
                          orderHistory[index].itemDestination,
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.8),
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                        subtitle: Text(
                          orderHistory[index].itemTitle,
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                        trailing: Text(
                          "Completed",
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                        onTap: () {},
                      ),
                    ),
                  );
                }),
          ),
      ],
    );
  }
}
