/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

class Magnet extends _i1.TableRow {
  Magnet({
    int? id,
    required this.identifier,
    required this.x,
    required this.y,
    required this.color,
    required this.text,
    required this.createdAt,
  }) : super(id);

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

  static final t = MagnetTable();

  String identifier;

  int x;

  int y;

  String color;

  String text;

  DateTime createdAt;

  @override
  String get tableName => 'magnet';
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

  @override
  Map<String, dynamic> toJsonForDatabase() {
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

  @override
  Map<String, dynamic> allToJson() {
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

  @override
  void setColumn(
    String columnName,
    value,
  ) {
    switch (columnName) {
      case 'id':
        id = value;
        return;
      case 'identifier':
        identifier = value;
        return;
      case 'x':
        x = value;
        return;
      case 'y':
        y = value;
        return;
      case 'color':
        color = value;
        return;
      case 'text':
        text = value;
        return;
      case 'createdAt':
        createdAt = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  static Future<List<Magnet>> find(
    _i1.Session session, {
    MagnetExpressionBuilder? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Magnet>(
      where: where != null ? where(Magnet.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<Magnet?> findSingleRow(
    _i1.Session session, {
    MagnetExpressionBuilder? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<Magnet>(
      where: where != null ? where(Magnet.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<Magnet?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<Magnet>(id);
  }

  static Future<int> delete(
    _i1.Session session, {
    required MagnetExpressionBuilder where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Magnet>(
      where: where(Magnet.t),
      transaction: transaction,
    );
  }

  static Future<bool> deleteRow(
    _i1.Session session,
    Magnet row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  static Future<bool> update(
    _i1.Session session,
    Magnet row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  static Future<void> insert(
    _i1.Session session,
    Magnet row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert(
      row,
      transaction: transaction,
    );
  }

  static Future<int> count(
    _i1.Session session, {
    MagnetExpressionBuilder? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Magnet>(
      where: where != null ? where(Magnet.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }
}

typedef MagnetExpressionBuilder = _i1.Expression Function(MagnetTable);

class MagnetTable extends _i1.Table {
  MagnetTable() : super(tableName: 'magnet');

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  final id = _i1.ColumnInt('id');

  final identifier = _i1.ColumnString('identifier');

  final x = _i1.ColumnInt('x');

  final y = _i1.ColumnInt('y');

  final color = _i1.ColumnString('color');

  final text = _i1.ColumnString('text');

  final createdAt = _i1.ColumnDateTime('createdAt');

  @override
  List<_i1.Column> get columns => [
        id,
        identifier,
        x,
        y,
        color,
        text,
        createdAt,
      ];
}

@Deprecated('Use MagnetTable.t instead.')
MagnetTable tMagnet = MagnetTable();
