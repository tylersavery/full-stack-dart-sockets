/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'protocol.dart' as _i2;

class MagnetStateMessage extends _i1.SerializableEntity {
  MagnetStateMessage({required this.magnets});

  factory MagnetStateMessage.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return MagnetStateMessage(
        magnets: serializationManager
            .deserialize<List<_i2.Magnet>>(jsonSerialization['magnets']));
  }

  List<_i2.Magnet> magnets;

  @override
  Map<String, dynamic> toJson() {
    return {'magnets': magnets};
  }
}
