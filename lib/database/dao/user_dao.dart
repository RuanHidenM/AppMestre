import 'package:appmestre/database/app_database.dart';
import 'package:appmestre/modelos/userauth.dart';
import 'package:sqflite/sqlite_api.dart';

class UserDao{
  static const String tableSql =
      'CREATE TABLE User('
      'authenticated TEXT, '
      'created TEXT, '
      'expiration TEXT, '
      'token TEXT, '
      'message TEXT, '
      'usuario_nome TEXT, '
      'tenant_nome TEXT, '
      'empresa_nome TEXT, '
      ') ';

  //TODO: Salvando um UsuarioLogin
  Future<int> save(UserLog userlog) async{
    final Database db = await getDatabase();
    final Map<String, dynamic> userlogMap = Map();
    userlogMap['authenticated'] = userlog;
    userlogMap['created'] = userlog;
    userlogMap['expiration'] = userlog;
    userlogMap['token'] = userlog;
    userlogMap['message'] = userlog;
    userlogMap['usuario_nome'] = userlog;
    userlogMap['tenant_nome'] = userlog;
    userlogMap['empresa_nome'] = userlog;

    return db.insert('userLogado', userlogMap);
  }

  // Future<int> findAll() async{
  //   final Database db = await getDatabase();
  //   await db.query('user')
  // }

}