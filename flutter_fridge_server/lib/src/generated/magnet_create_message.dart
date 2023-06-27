/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

class MagnetCreateMessage extends _i1.SerializableEntity {
  MagnetCreateMessage({
    required this.x,
    required this.y,
    required this.text,
    required this.color,
  });

  factory MagnetCreateMessage.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return MagnetCreateMessage(
      x: serializationManager.deserialize<int>(jsonSerialization['x']),
      y: serializationManager.deserialize<int>(jsonSerialization['y']),
      text: serializationManager.deserialize<String>(jsonSerialization['text']),
      color:
          serializationManager.deserialize<String>(jsonSerialization['color']),
    );
  }

  int x;

  int y;

  String text;

  String color;

  @override
  Map<String, dynamic> toJson() {
    return {
      'x': x,
      'y': y,
      'text': text,
      'color': color,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'x': x,
      'y': y,
      'text': text,
      'color': color,
    };
  }
}
