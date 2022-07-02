import 'package:booktrip/models/model_order.dart';

class Users {
  String? itemId;
  String? itemNama;
  String? itemEmail;
  String? itemUsername;
  String? itemPassword;
  List? order;

  Users({
    this.itemId,
    this.itemNama,
    this.itemEmail,
    this.itemUsername,
    this.itemPassword,
    this.order,
  });

  Map<String, dynamic> toJson() {
    return {
      "id": itemId,
      "nama": itemNama,
      "email": itemEmail,
      "username": itemUsername,
      "password": itemPassword,
      "order": order,
    };
  }

  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
      itemNama: json['nama'],
      itemId: json['id'],
      itemEmail: json['email'],
      itemUsername: json['username'],
      itemPassword: json['password'],
      order: json['order'],
    );
  }
}
