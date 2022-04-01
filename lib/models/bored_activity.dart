// This file was created using the following service:
// https://app.quicktype.io/?l=dart
//
// To parse this JSON data, do
//   final boredActivity = boredActivityFromJson(jsonString);

import 'dart:convert';

BoredActivity boredActivityFromJson(String str) =>
    BoredActivity.fromJson(json.decode(str));

String boredActivityToJson(BoredActivity data) => json.encode(data.toJson());

class BoredActivity {
  BoredActivity({
    required this.name,
    required this.type,
    required this.participants,
    required this.price,
    required this.link,
    required this.key,
    required this.accessibility,
  });

  final String name;
  final String type;
  final int participants;
  final double price;
  final String link;
  final String key;
  final double accessibility;

  factory BoredActivity.fromJson(Map<String, dynamic> json) => BoredActivity(
        name: json['activity'],
        type: json['type'],
        participants: json['participants'],
        price: json['price'].toDouble(),
        link: json['link'],
        key: json['key'],
        accessibility: json['accessibility'].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'activity': name,
        'type': type,
        'participants': participants,
        'price': price,
        'link': link,
        'key': key,
        'accessibility': accessibility,
      };
}
