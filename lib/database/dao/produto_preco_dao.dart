import 'package:appmestre/modelos/produto_preco.dart';
import 'package:sqflite/sqflite.dart';
import 'package:appmestre/database/app_database.dart';

class ProdutoPrecoDao{

  //TODO: Criação da tabela ProdutoPreco
  static const String tableSql =
      'CREATE TABLE ProdutoPreco('
      'produtoId TEXT,'
      'tabelaId TEXT,'
      'tabelaNome TEXT,'
      'preco REAL,'
      'precoPromocional REAL)';

  //TODO: Salvando Produto Preco
  Future<int> save(List<ProdutoPreco> produtoPreco) async{
    for(int i = 0; i < produtoPreco.length; i++){
      final Database db = await getDatabase();
      final Map<String, dynamic> produtoPrecoMap = Map();

      produtoPrecoMap['produtoId'] = produtoPreco[i].produtoId;
      produtoPrecoMap['tabelaId'] = produtoPreco[i].tabelaId;
      produtoPrecoMap['tabelaNome'] = produtoPreco[i].tabelaNome;
      produtoPrecoMap['preco'] = produtoPreco[i].preco;
      produtoPrecoMap['precoPromocional'] = produtoPreco[i].precoPromocional;

      return db.insert('ProdutoPreco', produtoPrecoMap);
    }
    return 1;
  }

  Future<List<ProdutoPreco>> findProdutopreco() async{
    final Database db = await getDatabase();
    await db.query('ProdutoPreco');
    final List<Map<String, dynamic>> result = await db.rawQuery('SELECT * FROM ProdutoPreco');
    final List<ProdutoPreco> produtoPrecos = [];

    for(Map<String, dynamic> row in result){
        ProdutoPreco produtoPreco = ProdutoPreco(
          row['produtoId'],
          row['tabelaId'],
          row['tabelaNome'],
          row['preco'],
          row['precoPromocional'],
        );
        produtoPrecos.add(produtoPreco);
        print('produtoPrecos: $produtoPrecos');
    }
    return produtoPrecos;
  }
}