/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

class MagnetUpdateMessage extends _i1.SerializableEntity {
  MagnetUpdateMessage({
    required this.identifier,
    required this.x,
    required this.y,
  });

  factory MagnetUpdateMessage.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return MagnetUpdateMessage(
      identifier: serializationManager
          .deserialize<String>(jsonSerialization['identifier']),
      x: serializationManager.deserialize<int>(jsonSerialization['x']),
      y: serializationManager.deserialize<int>(jsonSerialization['y']),
    );
  }

  String identifier;

  int x;

  int y;

  @override
  Map<String, dynamic> toJson() {
    return {
      'identifier': identifier,
      'x': x,
      'y': y,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'identifier': identifier,
      'x': x,
      'y': y,
    };
  }
}
