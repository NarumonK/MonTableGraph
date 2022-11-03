import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class NumberModel {
  final String id;
  final String number;

  NumberModel({
    required this.id,
    required this.number,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'number': number,
    };
  }

  factory NumberModel.fromMap(Map<String, dynamic> map) {
    return NumberModel(
      id: (map['id'] ?? '') as String,
      number: (map['number'] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory NumberModel.fromJson(String source) =>
      NumberModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
