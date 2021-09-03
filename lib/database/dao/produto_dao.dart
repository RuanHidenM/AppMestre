import 'package:appmestre/database/app_database.dart';
import 'package:appmestre/modelos/produto.dart';
import 'package:sqflite/sqflite.dart';

class ProdutoDao{

  //TODO: Criação da table Produto
  static const String tableSql =
      'CREATE TABLE Produtos('
      'referencia TEXT,'
      'sku TEXT,'
      'descricao TEXT,'
      'complemento TEXT,'
      'ncmId TEXT,'
      'abreviacao TEXT,'
      'garantia TEXT,'
      'observacao TEXT,'
      'margemLucro TEXT,'
      'pisCofinsCreditos TEXT,'
      'cestCodigo TEXT,'
      'anpCodigo TEXT,'
      'registroAnvisa TEXT,'
      'detalhes TEXT,'
      'id TEXT,'
      'cadastroUsuarioId TEXT,'
      'cadastroUsuarioNome TEXT,'
      'cadastroData TEXT,'
      'alteracaoUsuarioId TEXT,'
      'alteracaoUsuarioNome TEXT,'
      'alteracaoData TEXT,'
      'descricaoView TEXT)';

  //TODO: Salvando produto
  Future<int> save(List<Produto> produto) async{
     for(int i = 0; i < produto.length; i++){
       final Database db = await getDatabase();
       final Map<String, dynamic> produtoMap = Map();

       produtoMap['referencia'] = produto[i].referencia;
       produtoMap['sku'] = produto[i].sku;
       produtoMap['descricao'] = produto[i].descricao;
       produtoMap['complemento'] = produto[i].complemento;
       produtoMap['ncmId'] = produto[i].ncmId;
       produtoMap['abreviacao'] = produto[i].abreviacao;
       produtoMap['garantia'] = produto[i].garantia;
       produtoMap['observacao'] = produto[i].observacao;
       produtoMap['margemLucro'] = produto[i].margemLucro;
       produtoMap['pisCofinsCreditos'] = produto[i].pisCofinsCreditos;
       produtoMap['cestCodigo'] = produto[i].cestCodigo;
       produtoMap['anpCodigo'] = produto[i].anpCodigo;
       produtoMap['registroAnvisa'] = produto[i].registroAnvisa;
       produtoMap['detalhes'] = produto[i].detalhes;
       produtoMap['id'] = produto[i].id;
       produtoMap['cadastroUsuarioId'] = produto[i].cadastroUsuarioId;
       produtoMap['cadastroUsuarioNome'] = produto[i].cadastroUsuarioNome;
       produtoMap['cadastroData'] = produto[i].cadastroData;
       produtoMap['alteracaoUsuarioId'] = produto[i].alteracaoUsuarioId;
       produtoMap['alteracaoUsuarioNome'] = produto[i].alteracaoUsuarioNome;
       produtoMap['alteracaoData'] = produto[i].alteracaoData;
       produtoMap['descricaoView'] = produto[i]. descricaoView;

       return db.insert('Produtos', produtoMap);
     }
    return 1;
  }

  //TODO Buscando todos os produtos
  Future<List<Produto>> findProduto() async{
    final Database db = await getDatabase();
    await db.query('Produtos');
    final List<Map<String, dynamic>> result = await db.rawQuery('SELECT * FROM Produtos');
    final List<Produto> produtos = [];

    //TODO: Produto
    for(Map<String, dynamic> row in result){
      final Produto produto = Produto(
        row['referencia'],
        row['sku'],
        row['descricao'],
        row['complemento'],
        row['ncmId'],
        row['abreviacao'],
        row['garantia'],
        row['observacao'],
        row['margemLucro'],
        row['pisCofinsCreditos'],
        row['cestCodigo'],
        row['anpCodigo'],
        row['registroAnvisa'],
        row['detalhes'],
        row['id'],
        row['cadastroUsuarioId'],
        row['cadastroUsuarioNome'],
        row['cadastroData'],
        row['alteracaoUsuarioId'],
        row['alteracaoUsuarioNome'],
        row['alteracaoData'],
        row['descricaoView'],
      );
      produtos.add(produto);
    }
    print('retornado da tabela: $produtos');
    return produtos;
  }
}