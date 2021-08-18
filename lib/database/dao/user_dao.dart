import 'dart:math';

import 'package:appmestre/database/app_database.dart';
import 'package:appmestre/modelos/usuario.dart';
import 'package:sqflite/sqlite_api.dart';

class UserDao{

  static const String tableSql =
      'CREATE TABLE Usuario('
      'id TEXT, '
      'nome TEXT, '
      'email TEXT, '
      'tenantid TEXT, '
      'token TEXT) ';

  //TODO: Salvando um UsuarioLogin
  Future<int> save(Usuario usuario) async{
    findUsuario().then((value) async {
      if(value.length == 0){

        final Database db = await getDatabase();
        final Map<String, dynamic> userMap = Map();

        userMap['id'] = usuario.id;
        userMap['nome'] = usuario.nome;
        userMap['email'] = usuario.email;
        userMap['tenantid'] = usuario.tenantid;
        userMap['token'] = usuario.token;

        return db.insert('Usuario', userMap);

      }
    });
    return 0;
  }


  //TODO: Buscando todos os Usuario
  Future<List<Usuario>> findUsuario() async{
    final Database db = await getDatabase();
    await db.query('Usuario');
    final List<Map<String, dynamic>> result = await db.rawQuery('SELECT * FROM Usuario');
    final List<Usuario> usuarios = [];

    for(Map<String, dynamic> row in result){
      final Usuario usuario = Usuario(
          row['id'],
          row['nome'],
          row ['email'],
          row['tenantid'],
          row['token'],
      );

      usuarios.add(usuario);
      //print('Usuario buscados : ${usuarios.length}');
    }
    return usuarios;
  }

  //TODO: Deletando todos o usuario na tabela (Usuario) logado.
  Future<int> deletaUsuarioLogado() async{
    final Database db = await getDatabase();
    //return db.rawDelete('DELETE FROM prod')
    return db.delete('Usuario');
  }
}