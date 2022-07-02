import 'package:booktrip/models/model_order.dart';
import 'package:booktrip/models/model_user.dart';
import 'package:booktrip/screen/components/dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:booktrip/constant.dart';

class TitleAndPrice extends StatefulWidget {
  const TitleAndPrice(
      {Key? key,
      required this.title,
      required this.price,
      required this.destination,
      required this.detail})
      : super(key: key);

  final String title, destination, price, detail;

  @override
  State<TitleAndPrice> createState() => _TitleAndPriceState();
}

class _TitleAndPriceState extends State<TitleAndPrice> {
  final user = FirebaseAuth.instance.currentUser;
  Users? loggedInUser;
  @override
  void initState() {
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      loggedInUser = Users.fromJson(value.data()!);
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Dialogs dialog = new Dialogs();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.6,
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "${widget.title}".toUpperCase(),
                        style: TextStyle(
                            color: kTextColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 21),
                      ),
                    ],
                  ),
                ),
              ),
              Spacer(),
              Text(
                widget.price,
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.blue,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            widget.destination,
            style: TextStyle(
                fontSize: 16, color: kTextColor, fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            widget.detail,
            style: TextStyle(color: kTextColor, fontSize: 14),
          ),
          SizedBox(
            height: 16,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 16,
            width: MediaQuery.of(context).size.width,
            child: ElevatedButton(
              onPressed: () async {
                Orders order = Orders(
                    destination: widget.destination, price: widget.price);
                dialog.Information(
                    context,
                    'Confirmation',
                    'Are You Wish To Continue Booking This Destination ?',
                    order,
                    loggedInUser!.itemId!);
              },
              child: Text(
                "Book Now",
                style: TextStyle(fontSize: 21, fontWeight: FontWeight.w600),
              ),
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ))),
            ),
          ),
          SizedBox(
            height: 8,
          )
        ],
      ),
    );
  }
}
