class Orders {
  String? destination;
  String? price;

  Orders({
    this.destination,
    this.price,
  });

  Map<String, dynamic> toJson() {
    return {
      "destination": destination,
      "price": price,
    };
  }

  factory Orders.fromJson(Map<String, dynamic> json) {
    return Orders(
      destination: json['destination'],
      price: json['price'],
    );
  }
}
