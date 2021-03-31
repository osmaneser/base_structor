// To parse this JSON data, do
//
//     final reqSignIn = reqSignInFromJson(jsonString);

import 'dart:convert';

ReqSignIn reqSignInFromJson(String str) => ReqSignIn.fromJson(json.decode(str));

String reqSignInToJson(ReqSignIn data) => json.encode(data.toJson());

class ReqSignIn {
    ReqSignIn({
        this.username,
        this.password,
    });

    String username;
    String password;

    factory ReqSignIn.fromJson(Map<String, dynamic> json) => ReqSignIn(
        username: json["username"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
    };
}
