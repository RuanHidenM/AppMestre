import 'package:appmestre/modelos/produto_codigo_barra.dart';
import 'package:sqflite/sqflite.dart';
import 'package:appmestre/database/app_database.dart';

class ProdutoCodigoBarraDao{

  //TODO: Crianção da tabela ProdutoCodigo
  static const String tableSql =
      'CREATE TABLE ProdutosCodigoBarra('
      'produtoId TEXT,'
      'codigo TEXT,'
      'empresaId TEXT'
      ')';

  //TODO: Salvando Codigo de Barra do Produto
  Future<int> save(List<ProdutoCodigoBarra> produtoCodigoBarra) async{
    for(int i = 0; i < produtoCodigoBarra.length; i++){
      final Database db = await getDatabase();
      final Map<String, dynamic> produtoCodigoBarrasMap = Map();

      produtoCodigoBarrasMap['produtoId'] = produtoCodigoBarra[i].produtoId;
      produtoCodigoBarrasMap['codigo'] = produtoCodigoBarra[i].codigo;
      produtoCodigoBarrasMap['empresaId'] = produtoCodigoBarra[i].empresaId;

      return db.insert('ProdutosCodigoBarra', produtoCodigoBarrasMap);
    }
    return 1;
  }


  //TODO Retornando os codigo de barras
  Future<List<ProdutoCodigoBarra>> findProdutoCodigoBarra() async{
    final Database db = await getDatabase();
    await db.query('ProdutosCodigoBarra');
    final List<Map<String, dynamic>> result = await db.rawQuery('SELECT * FROM ProdutosCodigoBarra');
    final List<ProdutoCodigoBarra> produtoCodigoBarras = [];

    for(Map<String, dynamic> row in result){
      ProdutoCodigoBarra produtoCodigoBarra = ProdutoCodigoBarra(
        row['produtoId'],
        row['codigo'],
        row['empresaId'],
      );
      produtoCodigoBarras.add(produtoCodigoBarra);

    }
    print('CÓDIGO DE BARRAS : $produtoCodigoBarras');
    return produtoCodigoBarras;
  }

  //TODO: Deletando todos os codigos de barra
  Future<int> deleteCodigoBarra() async{
    final Database db = await getDatabase();
    return db.delete('ProdutosCodigoBarra');
  }

}