import 'package:appmestre/database/app_database.dart';
import 'package:appmestre/modelos/produto_preco.dart';
import 'package:sqflite/sqflite.dart';
import 'package:appmestre/modelos/produto_imagens.dart';

class ProdutoImagenDao{

  //TODO: Criação da tabela ProdutoImagen
  static const String tableSql =
      'CREATE TABLE ProdutosImagen('
      'produtoId TEXT,'
      'imagem TEXT,'
      'extensao TEXT,'
      'principal INTEGER,'
      'utilizar INTEGER,'
      'ur TEXT'
      ')';

  //TODO: Slavando o ProdutoImagen
  Future<int> save(List<ProdutoImagen> produtoImagen) async{
    for(int i = 0; i < produtoImagen.length; i++ ){
      final Database db = await getDatabase();
      final Map<String, dynamic> produtoImagenMap = Map();

      produtoImagenMap['produtoId'] = produtoImagen[i].produtoId;
      produtoImagenMap['imagem'] = produtoImagen[i].imagem;
      produtoImagenMap['extensao'] = produtoImagen[i].extensao;
      produtoImagenMap['principal'] = produtoImagen[i].principal;
      produtoImagenMap['utilizar'] = produtoImagen[i].utilizar;
      produtoImagenMap['ur'] = produtoImagen[i].url;

      return db.insert('ProdutosImagen', produtoImagenMap);
    }
    return 1;
  }

  //TODO: Buscando todas os Produto Imagens
  Future<List<ProdutoImagen>> findProdutoImagen() async{

    final Database db = await getDatabase();
    await db.query('ProdutosImagen');

    final List<Map<String, dynamic>> result = await db.rawQuery('SELECT * FROM ProdutosImagen');
    final List<ProdutoImagen> produtoImagens = [];

    for(Map<String, dynamic>  row in result){
      ProdutoImagen produtoImagen = ProdutoImagen(
        row['produtoId'],
        row['imagem'],
        row['extensao'],
        row['principal'],
        row['utilizar'],
        row['ur']
      );
      produtoImagens.add(produtoImagen);
      print('Imagens : $produtoImagens');
    }

    return produtoImagens;
  }

  //TODO: Deletando todos os ProdutoImagen
  Future<int> deleteProdutoImagen() async{
    final Database db = await getDatabase();
    return db.delete('ProdutosImagen');
  }

}