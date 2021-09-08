import 'package:appmestre/database/app_database.dart';
import 'package:appmestre/database/dao/empresa_dao.dart';
import 'package:appmestre/modelos/produto_card.dart';
import 'package:sqflite/sqflite.dart';

class CardProdutoDao{
  //TODO: Buscando id usuario logado
  final _empresaDao = EmpresaDao();

  //TODO: Buscando as inf do produto para o CARD Catalogo
  Future<List<ProdutoCard>> findCardProduto() async{
    final Database db = await getDatabase();
    await db.query('Produtos');

    //TODO: ID da empresa selecionada
    final String idProdutoLogado = await _empresaDao.findEmpresaPadrao(tipo: 'id');

    final List<Map<String, dynamic>> result = await db.rawQuery(
        'SELECT '
              ' P.id,'
              ' P.descricao, '
              'PP.preco, '
              'PE.quantidadeSaldo, '
              'PI.imagem '
            'FROM'
              ' Produtos P '
            'LEFT JOIN ProdutosEmpresa PES ON PES.empresaId = "$idProdutoLogado"' //TODO: CODIGO DA EMPRESA LOGADA
            'LEFT JOIN ProdutosEstoque PE ON PE.produtoId = P.id AND PE.empresaId = "$idProdutoLogado"'
            'LEFT JOIN ProdutosPreco PP ON PP.produtoId = P.id '//TODO Faltando filtrar o preco por true
            'LEFT JOIN ProdutosImagen PI ON PI.produtoId = p.id '
            'WHERE PES.empresaId = "$idProdutoLogado"'
            //'WHERE P.referencia = "1006533"'
    );

    final List<ProdutoCard> produtoCards = [];

    for(Map<String, dynamic> row in result){
      final ProdutoCard produtoCard = ProdutoCard(
         row['id'],
         row['descricao'],
         row['preco'],
         row['quantidadeSaldo'],
         row['imagem'],
      );
      produtoCards.add(produtoCard);
    }
    return produtoCards;
  }
}