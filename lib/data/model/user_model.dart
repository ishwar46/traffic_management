import 'package:meta/meta.dart';
import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    required this.userId,
    required this.fcmToken,
    required this.name,
    required this.username,
    required this.phone,
    required this.email,
  });

  String userId;
  String fcmToken;
  String name;
  String username;
  String phone;
  String email;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        userId: json["user_id"],
        fcmToken: json["fcm_token"],
        name: json["name"],
        username: json["username"],
        phone: json["phone"],
        email: json["email"],
      );
  factory UserModel.fromFirebaseSnapshot(Map<String, dynamic> json) => UserModel(
      userId: json["user_id"],
      fcmToken: json["fcm_token"],
      name: json["name"],
      username: json["username"],
      phone: json["phone"],
      email: json["email"],
  );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "fcm_token": fcmToken,
        "name": name,
        "username": username,
        "phone": phone,
        "email": email,
      };
}
