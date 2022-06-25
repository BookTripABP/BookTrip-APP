class Timeline {
  final String itemId;
  final String itemAdress;
  final String itemDetail;
  final String itemTitle;

  Timeline(
      {required this.itemId,
      required this.itemAdress,
      required this.itemDetail,
      required this.itemTitle});

  Map<String, dynamic> toJson() {
    return {
      "id": itemId,
      "address": itemAdress,
      "detail": itemDetail,
      "title": itemTitle,
    };
  }

  factory Timeline.fromJson(Map<String, dynamic> json) {
    return Timeline(
      itemAdress: json['address'],
      itemId: json['id'],
      itemDetail: json['detail'],
      itemTitle: json['title'],
    );
  }
}
