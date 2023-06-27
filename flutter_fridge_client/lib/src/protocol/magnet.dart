/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

class Magnet extends _i1.SerializableEntity {
  Magnet({
    this.id,
    required this.identifier,
    required this.x,
    required this.y,
    required this.color,
    required this.text,
    required this.createdAt,
  });

  factory Magnet.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Magnet(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      identifier: serializationManager
          .deserialize<String>(jsonSerialization['identifier']),
      x: serializationManager.deserialize<int>(jsonSerialization['x']),
      y: serializationManager.deserialize<int>(jsonSerialization['y']),
      color:
          serializationManager.deserialize<String>(jsonSerialization['color']),
      text: serializationManager.deserialize<String>(jsonSerialization['text']),
      createdAt: serializationManager
          .deserialize<DateTime>(jsonSerialization['createdAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String identifier;

  int x;

  int y;

  String color;

  String text;

  DateTime createdAt;

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'identifier': identifier,
      'x': x,
      'y': y,
      'color': color,
      'text': text,
      'createdAt': createdAt,
    };
  }
}
