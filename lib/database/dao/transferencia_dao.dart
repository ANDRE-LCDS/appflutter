import 'package:sqflite/sqflite.dart';


import '../../models/transferencia.dart';
import '../app_database.dart';

class TransferenciaDao {
  static const String tableSql = 'CREATE TABLE $_tableName ('
      'id INTEGER PRIMARY KEY,'
      'Valor INTEGER,'
      'Numero_conta INTEGER)';
  static const String _tableName = 'transferencia';
  static const String _id = 'id';
  static const String _valor = 'Valor';
  static const String _numeroConta = 'Numero_Conta';

  Future<int> save(Transferencia transferencia) async {
    final Database db = await getDatabase();
    Map<String, dynamic> transferenciaMap = _toMap(transferencia);
    return db.insert(_tableName, transferenciaMap);
  }

  Future<List<Transferencia>> buscaTransferencia() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> resultado = await db.query(_tableName);
    List<Transferencia> transferencias = _toList(resultado);
    return transferencias;
  }

  Future<int> update(Transferencia transferencia) async {
    final Database db = await getDatabase();
    final Map<String, dynamic> transferenciaMap = _toMap(transferencia);
    return db.update(
      _tableName,
      transferenciaMap,
      where: 'id = ?',
      whereArgs: [transferencia.id],
    );
  }

  Future<int> delete(int id) async {
    final Database db = await getDatabase();
    return db.delete(
      _tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Map<String, dynamic> _toMap(Transferencia transferencia) {
    final Map<String, dynamic> transferenciaMap = Map();
    transferenciaMap[_valor] = transferencia.valor;
    transferenciaMap[_numeroConta] = transferencia.numeroConta;
    return transferenciaMap;
  }

  List<Transferencia> _toList(List<Map<String, dynamic>> resultado) {
    final List<Transferencia> transferencias = [];
    for (Map<String, dynamic> row in resultado) {
      final Transferencia transferencia = Transferencia(
        row[_id],
        row[_valor],
        row[_numeroConta],
      );
      transferencias.add(transferencia);
    }
    return transferencias;
  }
}