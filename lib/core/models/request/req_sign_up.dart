// To parse this JSON data, do
//
//     final reqSignUp = reqSignUpFromJson(jsonString);

import 'dart:convert';

ReqSignUp reqSignUpFromJson(String str) => ReqSignUp.fromJson(json.decode(str));

String reqSignUpToJson(ReqSignUp data) => json.encode(data.toJson());

class ReqSignUp {
    ReqSignUp({
        this.name,
        this.surname,
        this.gender,
        this.email,
        this.phone,
        this.username,
        this.password,
    });

    String name;
    String surname;
    int gender;
    String email;
    String phone;
    String username;
    String password;

    factory ReqSignUp.fromJson(Map<String, dynamic> json) => ReqSignUp(
        name: json["name"],
        surname: json["surname"],
        gender: json["gender"],
        email: json["email"],
        phone: json["phone"],
        username: json["username"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "surname": surname,
        "gender": gender,
        "email": email,
        "phone": phone,
        "username": username,
        "password": password,
    };
}
