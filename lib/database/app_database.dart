import 'package:appmestre/database/dao/user_dao.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

//TODO:Criando uma database mestre
Future<Database> getDatabase() async{
  final String dbPath = await getDatabasesPath();
  final String path = join(dbPath, 'mestre.db');

  //await deleteDatabase(path); // deleta a base de dados que estiver o indereço path informado
  return openDatabase(
    path,
    onCreate: (db, version){
      db.execute(UserDao.tableSql);
    },
    version: 1,
    //onDowngrade: onDatabaseDowngradeDelete //TODO: upando a verção e deixando essa linha de comando ligada, ira deletar os dados da verção anterior
  );
}