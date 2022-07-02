class Destinasi {
  final String itemId;
  final String itemAdress;
  final String itemDetail;
  final String itemDestination;
  final String itemHarga;
  final String itemTitle;

  Destinasi(
      {required this.itemId,
      required this.itemAdress,
      required this.itemDetail,
      required this.itemHarga,
      required this.itemTitle,
      required this.itemDestination});

  Map<String, dynamic> toJson() {
    return {
      "id": itemId,
      "address": itemAdress,
      "detail": itemDetail,
      "destination": itemDestination,
      "harga": itemHarga,
      "title": itemTitle,
    };
  }

  factory Destinasi.fromJson(json) {
    return Destinasi(
      itemAdress: json['address'],
      itemId: json['id'],
      itemDetail: json['detail'],
      itemDestination: json['destination'],
      itemHarga: json['harga'],
      itemTitle: json['title'],
    );
  }
}
