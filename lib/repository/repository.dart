import 'dart:convert';
import 'package:booktrip/models/model_destinasi.dart';
import 'package:booktrip/models/model_timeline.dart';
import 'package:booktrip/models/model_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class Repository {
  Stream<List<Destinasi>> getDataDestinasi() => FirebaseFirestore.instance
      .collection("destination")
      .snapshots()
      .map((event) =>
          event.docs.map((e) => Destinasi.fromJson(e.data())).toList());

  Stream<List<Timeline>> getDataTimeline() => FirebaseFirestore.instance
      .collection("timeline")
      .snapshots()
      .map((event) =>
          event.docs.map((e) => Timeline.fromJson(e.data())).toList());

  Stream<List<Users>> getDataUser() => FirebaseFirestore.instance
      .collection("user")
      .snapshots()
      .map((event) => event.docs.map((e) => Users.fromJson(e.data())).toList());
}
