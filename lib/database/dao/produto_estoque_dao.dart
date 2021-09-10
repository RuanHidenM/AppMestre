import 'package:appmestre/database/app_database.dart';
import 'package:appmestre/modelos/produto_estoques.dart';
import 'package:sqflite/sqflite.dart';

class ProdutoEstoqueDao{

  //TODO: Criação da table Produto
  static const String tableSql =
      'CREATE TABLE ProdutosEstoque('
      'produtoId TEXT,'
      'empresaId TEXT,'
      'quantidadeSaldo REAL,'
      'quantidadeMinima REAL,'
      'quantidadeMaxima REAL,'
      'custoLiquido REAL,'
      'custoFornecedor REAL,'
      'custoMedio REAL,'
      'icmsStBcRet REAL,'
      'icmsStVlRet REAL,'
      'icmsStPrRet REAL,'
      'icmsVlSubstituto REAL,'
      'au REAL)';

  //TODO: Salvando Estoque do produto
  Future<int> save(List<ProdutoEstoques> produtoEstoque) async{
    for(int i = 0; i < produtoEstoque.length; i++){
      final Database db = await getDatabase();
      final Map<String, dynamic> estoqueMap = Map();

      estoqueMap['produtoId'] = produtoEstoque[i].produtoId;
      estoqueMap['empresaId'] = produtoEstoque[i].empresaId;
      estoqueMap['quantidadeSaldo'] = produtoEstoque[i].quantidadeSaldo;
      estoqueMap['quantidadeMinima'] = produtoEstoque[i].quantidadeMinima;
      estoqueMap['quantidadeMaxima'] = produtoEstoque[i].quantidadeMaxima;
      estoqueMap['custoLiquido'] = produtoEstoque[i].custoLiquido;
      estoqueMap['custoFornecedor'] = produtoEstoque[i].custoFornecedor;
      estoqueMap['custoMedio'] = produtoEstoque[i].custoMedio;
      estoqueMap['icmsStBcRet'] = produtoEstoque[i].icmsStBcRet;
      estoqueMap['icmsStVlRet'] = produtoEstoque[i].icmsStVlRet;
      estoqueMap['icmsStPrRet'] = produtoEstoque[i].icmsStPrRet;
      estoqueMap['icmsVlSubstituto'] = produtoEstoque[i].icmsVlSubstituto;
      estoqueMap['au'] = produtoEstoque[i].au;

      return db.insert('ProdutosEstoque', estoqueMap);
    }
    return 1;
  }

  //TODO: Buscando todos os estoques
  Future<List<ProdutoEstoques>> findProdutoEstoque() async{
    final Database db = await getDatabase();
    await db.query('ProdutosEstoque');
    final List<Map<String, dynamic>> result = await db.rawQuery('SELECT * FROM ProdutosEstoque');
    final List<ProdutoEstoques> produtoEstoques = [];

    //TODO: Estoque
    for(Map<String, dynamic> row in result){
      final ProdutoEstoques produtoEstoque = ProdutoEstoques(
        row['produtoId'],
        row['empresaId'],
        row['quantidadeSaldo'],
        row['quantidadeMinima'],
        row['quantidadeMaxima'],
        row['custoLiquido'],
        row['custoFornecedor'],
        row['custoMedio'],
        row['icmsStBcRet'],
        row['icmsStVlRet'],
        row['icmsStPrRet'],
        row['icmsVlSubstituto'],
        row['au'],
      );
      produtoEstoques.add(produtoEstoque);
    }
    print('Estoque : $produtoEstoques');
    return produtoEstoques;
  }

  //TODO: Deletando todos os ProdutoEstoque
  Future<int> deleteProdutoEmpresa() async{
    final Database db = await getDatabase();
    return db.delete('ProdutosEstoque');
  }
}

