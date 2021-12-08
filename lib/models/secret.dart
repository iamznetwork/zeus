import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'secret.g.dart';

@HiveType(typeId: 0)
class Secret extends HiveObject {
  @HiveField(0)
  String? title;

  @HiveField(1)
  String? description;

  @HiveField(2)
  String? url;

  @HiveField(3)
  String? username;

  @HiveField(4)
  String? secret;

  @HiveField(5)
  String? notes;

  Secret(
      {this.title,
      this.description,
      this.url,
      this.username,
      this.secret,
      this.notes});

  Map<String, dynamic> toMap() {
    return {
      "title": title,
      "description": description,
      "url": url,
      "username": username,
      "secret": secret,
      "notes": notes
    };
  }

  @override
  String toString() {
    return toMap().toString();
  }
}
