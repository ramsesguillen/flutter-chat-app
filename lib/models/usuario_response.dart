// To parse this JSON data, do
//
//     final userResponse = userResponseFromJson(jsonString);

import 'dart:convert';

import 'package:chat_app/models/usuario.dart';

UserResponse userResponseFromJson(String str) => UserResponse.fromJson(json.decode(str));

String userResponseToJson(UserResponse data) => json.encode(data.toJson());

class UserResponse {
    UserResponse({
        this.ok,
        this.usuarios,
    });

    bool ok;
    List<Usuario> usuarios;

    factory UserResponse.fromJson(Map<String, dynamic> json) => UserResponse(
        ok: json["ok"],
        usuarios: List<Usuario>.from(json["usuarios"].map((x) => Usuario.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "ok": ok,
        "usuarios": List<dynamic>.from(usuarios.map((x) => x.toJson())),
    };
}

