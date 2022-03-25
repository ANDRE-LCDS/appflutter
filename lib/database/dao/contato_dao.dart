import 'package:sqflite/sqflite.dart';

import '../../models/contato.dart';
import '../app_database.dart';

class ContatoDao {
  static const String tableSql = 'CREATE TABLE $_tableName ('
      'id INTEGER PRIMARY KEY,'
      'Nome VARCHAR(50),'
      'Numero_conta INTEGER)';
  static const String _tableName = 'contatos';
  static const String _id = 'id';
  static const String _nome = 'Nome';
  static const String _numeroConta = 'Numero_Conta';

  Future<int> save(Contato contato) async {
    final Database db = await getDatabase();
    Map<String, dynamic> contatoMap = _toMap(contato);
    return db.insert(_tableName, contatoMap);
  }

  Future<List<Contato>> buscaContato() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> resultado = await db.query(_tableName);
    List<Contato> contatos = _toList(resultado);
    return contatos;
  }

  Future<int> update(Contato contato) async {
    final Database db = await getDatabase();
    final Map<String, dynamic> contactMap = _toMap(contato);
    return db.update(
      _tableName,
      contactMap,
      where: 'id = ?',
      whereArgs: [contato.id],
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

  Map<String, dynamic> _toMap(Contato contato) {
    final Map<String, dynamic> contatoMap = Map();
    contatoMap[_nome] = contato.nome;
    contatoMap[_numeroConta] = contato.numeroConta;
    return contatoMap;
  }

  List<Contato> _toList(List<Map<String, dynamic>> resultado) {
    final List<Contato> contatos = [];
    for (Map<String, dynamic> row in resultado) {
      final Contato contato = Contato(
        row[_id],
        row[_nome],
        row[_numeroConta],
      );
      contatos.add(contato);
    }
    return contatos;
  }
}
