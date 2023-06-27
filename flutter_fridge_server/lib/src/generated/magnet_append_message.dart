/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import 'protocol.dart' as _i2;

class MagnetAppendMessage extends _i1.SerializableEntity {
  MagnetAppendMessage({required this.magnet});

  factory MagnetAppendMessage.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return MagnetAppendMessage(
        magnet: serializationManager
            .deserialize<_i2.Magnet>(jsonSerialization['magnet']));
  }

  _i2.Magnet magnet;

  @override
  Map<String, dynamic> toJson() {
    return {'magnet': magnet};
  }

  @override
  Map<String, dynamic> allToJson() {
    return {'magnet': magnet};
  }
}
