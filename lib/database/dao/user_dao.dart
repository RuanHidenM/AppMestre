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
    findQuantUsuarioLogado().then((value) async {
      if(value == 0){

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

  //TODO: Buscando o usuario logado
  Future<Usuario> findUsuario() async{
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
    }

    if(usuarios.isNotEmpty){
      Usuario returnUsuario = Usuario(usuarios[0].id, usuarios[0].nome, usuarios[0].email, usuarios[0].tenantid, usuarios[0].token);
      //print('tipo do retorno findusuario ${returnUsuario.toString()}');
      return returnUsuario;
    }

    return Usuario('...', '...', '...', '...', '...');
  }

  //TODO: Retornando a quantidade de usuarios cadatrados
  Future<int> findQuantUsuarioLogado() async{
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
    }
    return usuarios.length;
  }

  //TODO: Deletando todos o usuario na tabela (Usuario) logado.
  Future<int> deletaUsuarioLogado() async{
    final Database db = await getDatabase();
    //return db.rawDelete('DELETE FROM prod')
    return db.delete('Usuario');
  }
}