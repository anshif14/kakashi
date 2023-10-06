import 'package:meta/meta.dart';
import 'dart:convert';

Name nameFromJson(String str) => Name.fromJson(json.decode(str));

String nameToJson(Name data) => json.encode(data.toJson());

class Name {
  String name;

  Name({
    required this.name,
  });

  factory Name.fromJson(Map<String, dynamic> json) => Name(
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
  };
}
