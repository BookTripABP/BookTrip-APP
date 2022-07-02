import 'package:booktrip/models/model_order.dart';
import 'package:booktrip/screen/components/completePayment.dart';
import 'package:booktrip/screen/orderhistory/orderhistory.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

_confirmResult(bool isYes, BuildContext context, Orders order, String id) {
  List orders = [];
  orders.add(order.destination);
  if (isYes) {
    final docUser = FirebaseFirestore.instance.collection('users').doc(id);
    docUser.update({"order": FieldValue.arrayUnion(orders)});
    Navigator.pushNamed(context, Payments.routeAdr);
  } else {
    Navigator.pop(context);
  }
}

class Dialogs {
  Information(BuildContext context, String title, String desc, Orders order,
      String id) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: SingleChildScrollView(
              child: ListBody(
                children: [Text(desc)],
              ),
            ),
            actions: [
              TextButton(
                style: TextButton.styleFrom(
                  textStyle:
                      const TextStyle(fontSize: 16, color: Color(0xFF2196F3)),
                ),
                onPressed: () => _confirmResult(false, context, order, id),
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                  onPressed: () => _confirmResult(true, context, order, id),
                  child: Text("Confirm")),
            ],
          );
        });
  }
}
