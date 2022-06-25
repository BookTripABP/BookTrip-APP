import 'package:booktrip/models/model_user.dart';
import 'package:booktrip/repository/repository.dart';
import 'package:flutter/material.dart';

import '../../models/model_destinasi.dart';
import '../components/header_with_searchbar.dart';

class order extends StatefulWidget {
  const order({Key? key}) : super(key: key);

  @override
  State<order> createState() => _orderState();
}

class _orderState extends State<order> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [HeaderWithSearchBar(size: size), Text("STILL IN PROGRESS")],
      ),
    );
  }
}
