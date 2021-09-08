import 'package:appmestre/database/app_database.dart';
import 'package:appmestre/modelos/produto_empresa.dart';
import 'package:sqflite/sqflite.dart';

class ProdutoEmpresaDao{

  //TODO: Criação da tabela Produto Estoque o SQLITE
  static const String tableSql =
      'CREATE TABLE ProdutosEmpresa('
      'produtoId TEXT,'
      'empresaId TEXT,'
      'cstOrigem INTEGER,'
      'cstIcms INTEGER,'
      'indicadorProducao INTEGER,'
      'tipo INTEGER)';


  //TODO: Salvando Produto Estoque
  Future<int> save(List<ProdutoEmpresa> produtoEmpresa) async{
    for(int i = 0; i < produtoEmpresa.length; i++){
      final Database db = await getDatabase();
      final Map<String, dynamic> produtoEmpresaMap = Map();

      produtoEmpresaMap['produtoId'] = produtoEmpresa[i].produtoId;
      produtoEmpresaMap['empresaId'] = produtoEmpresa[i].empresaId;
      produtoEmpresaMap['cstOrigem'] = produtoEmpresa[i].cstOrigem;
      produtoEmpresaMap['cstIcms'] = produtoEmpresa[i].cstIcms;
      produtoEmpresaMap['indicadorProducao'] = produtoEmpresa[i].indicadorProducao;
      produtoEmpresaMap['tipo'] = produtoEmpresa[i].tipo;
      
      return db.insert('ProdutosEmpresa', produtoEmpresaMap);
    }
    return 1;
  }

  //TODO: Buscando todos os dados
  Future<List<ProdutoEmpresa>> findProdutoEmpresa() async{
    final Database db = await getDatabase();
    await db.query('ProdutosEmpresa');
    final List<Map<String, dynamic>> result = await db.rawQuery('SELECT * FROM ProdutosEmpresa');

    final List<ProdutoEmpresa> produtoEmpresas = [];

    for(Map<String, dynamic> row in result){
     final ProdutoEmpresa produtoEmpresa = ProdutoEmpresa(
       row['produtoId'],
       row['empresaId'],
       row['cstOrigem'],
       row['cstIcms'],
       row['indicadorProducao'],
       row['tipo'],
     );
     produtoEmpresas.add(produtoEmpresa);
     print('Empresas: $produtoEmpresas');
    }
    return produtoEmpresas;
  }


  //TODO: Deletando todos os ProdutoEmpresa
  Future<int> deleteProdutoEmpresa() async{
    final Database db = await getDatabase();
    return db.delete('ProdutosEmpresa');
  }
}