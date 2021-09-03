import 'package:appmestre/database/dao/produto_empresa_dao.dart';
import 'package:appmestre/database/dao/produto_estoque_dao.dart';
import 'package:appmestre/database/dao/produto_dao.dart';
import 'package:appmestre/database/dao/produto_preco_dao.dart';
import 'package:appmestre/database/dao/user_dao.dart';
import 'package:appmestre/database/dao/empresa_dao.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

//TODO:Criando uma database mestre
Future<Database> getDatabase() async{
  final String dbPath = await getDatabasesPath();
  final String path = join(dbPath, 'mestre.db');

  return openDatabase(
    path,
    onCreate: (db, version){
      //TODO: Criando a tabela Usuario
      db.execute(UserDao.tableSql);

      //TODO: Criando a tabela Empresa
      db.execute(EmpresaDao.tableSql);

      //TODO: Criando a tabela Produto
      db.execute(ProdutoDao.tableSql);

      //TODO: Criando a tabela ProdutoEstoque
      db.execute(ProdutoEstoqueDao.tableSql);

      //TODO: Criando a tabela ProdutoEmpresa
      db.execute(ProdutoEmpresaDao.tableSql);

      //TODO: Criando a tabela ProdutoPreco
      db.execute(ProdutoPrecoDao.tableSql);

    },
    //TODO: Verção do db
    version: 1,
    //TODO: upando a verção e deixando essa linha de comando ligada, ira deletar os dados da verção anterior
    //onDowngrade: onDatabaseDowngradeDelete
  );

}