import 'dart:convert';

//This method directly decodes a json to a User object
User userFromJson(String str) => User.fromJson(json.decode(str));

//This method  directly encodes an User Object to a Json
String userToJson(User data) => json.encode(data.toJson());

class User {
  final String id;
  final String fullName;
  final String email;
  final String state;
  final String city;
  final String locality;
  final String password;
  final String token;

  User({
    required this.id,
    required this.fullName,
    required this.email,
    required this.state,
    required this.city,
    required this.locality,
    required this.password,
    required this.token,
  });

  //Deserialize: Convert a Map to Object
  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["_id"] as String? ?? "",
    fullName: json["fullName"] as String? ?? "",
    email: json["email"] as String? ?? "",
    state: json["state"] as String? ?? "",
    city: json["city"] as String? ?? "",
    locality: json["locality"] as String? ?? "",
    password: json["password"] as String? ?? "",
    token: json["token"] as String? ?? "",
  );

  //Serialize: Convert User object to a Map
  Map<String, dynamic> toJson() => {
    "id": id,
    "fullName": fullName,
    "email": email,
    "state": state,
    "city": city,
    "locality": locality,
    "password": password,
    "token": token,
  };
}