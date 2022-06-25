class User {
  final String itemId;
  final String itemNama;
  final String itemEmail;
  final String itemUsername;
  final String itemPassword;

  User({
    required this.itemId,
    required this.itemNama,
    required this.itemEmail,
    required this.itemUsername,
    required this.itemPassword,
  });

  Map<String, dynamic> toJson() {
    return {
      "id": itemId,
      "nama": itemNama,
      "email": itemEmail,
      "username": itemUsername,
      "password": itemPassword,
    };
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      itemNama: json['nama'],
      itemId: json['id'],
      itemEmail: json['email'],
      itemUsername: json['username'],
      itemPassword: json['password'],
    );
  }
}
