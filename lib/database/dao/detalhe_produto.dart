import 'package:appmestre/database/app_database.dart';
import 'package:appmestre/database/dao/empresa_dao.dart';
import 'package:appmestre/modelos/produto_detalhe.dart';
import 'package:sqflite/sqflite.dart';

class DetalheProdutoDao{

  final _empresaDao = EmpresaDao();

  //TODO: Buscando inf base do produto
  Future<ProdutoDetalhe> findDetalheProduto(String produtoId) async{
    final Database db = await getDatabase();
    await db.query('Produtos');
    //TODO: ID da empresa logada
    final String idEmpresaLogada = await _empresaDao.findEmpresaPadrao(tipo: 'id');
    final List<Map<String, dynamic>> result = await db.rawQuery(
        'SELECT'
            ' P.id, P.referencia,'
            ' P.sku,'
            ' P.descricao,'
            ' P.complemento,'
            ' P.ncmId,'
            ' P.abreviacao,'
            ' P.garantia,'
            ' P.observacao,'
            ' P.margemLucro,'
            ' P.pisCofinsCreditos,'
            ' P.cestCodigo,'
            ' P.anpCodigo,'
            ' P.registroAnvisa,'
            ' P.detalhes,'
            ' P.id,'
            ' P.cadastroUsuarioId,'
            ' P.cadastroUsuarioNome,'
            ' P.cadastroData,'
            ' P.alteracaoUsuarioId,'
            ' P.alteracaoUsuarioNome,'
            ' P.alteracaoData,'
            ' P.descricaoView,'
            ' PE.produtoId,'
            ' PE.empresaId,'
            ' PE.quantidadeSaldo,'
            ' PE.quantidadeMinima,'
            ' PE.quantidadeMaxima,'
            ' PE.custoLiquido,'
            ' PE.custoFornecedor,'
            ' PE.custoMedio,'
            ' PE.icmsStBcRet,'
            ' PE.icmsStVlRet,'
            ' PE.icmsStPrRet,'
            ' PE.icmsVlSubstituto,'
            ' PE.au,'
            ' PES.produtoId,'
            ' PES.empresaId,'
            ' PES.cstOrigem,'
            ' PES.cstIcms,'
            ' PES.indicadorProducao,'
            ' PES.tipo,'
            ' PP.produtoId,'
            ' PP.tabelaId,'
            ' PP.tabelaNome,'
            ' PP.preco,'
            ' PP.precoPromocional,'
            ' PCB.produtoId,'
            ' PCB.codigo,'
            ' PCB.empresaId '
        ' FROM'
            ' Produtos P,'
            ' ProdutosCodigoBarra PCB '
            ' LEFT JOIN ProdutosEmpresa PES ON PES.empresaId = "$idEmpresaLogada"' //TODO: CODIGO DA EMPRESA LOGADA
            ' LEFT JOIN ProdutosEstoque PE ON PE.produtoId = P.id AND PE.empresaId = "$idEmpresaLogada"'
            ' LEFT JOIN ProdutosPreco PP ON PP.produtoId = P.id '//TODO Faltando filtrar o preco por true
            ' LEFT JOIN ProdutosImagen PI ON PI.produtoId = p.id and PI.principal = true '
        ' WHERE'
            ' PES.empresaId = "$idEmpresaLogada"'
            ' AND P.id = "$produtoId"'
      //'WHERE P.referencia = "1006533"'
    );
    final List<ProdutoDetalhe> produto = [];

    for(Map<String, dynamic> row in result){
      final ProdutoDetalhe produtoDetalhes = ProdutoDetalhe(
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
        row['produtoId'],
        row['empresaId'],
        row['cstOrigem'],
        row['cstIcms'],
        row['indicadorProducao'],
        row['tipo'],
        row['produtoId'],
        row['tabelaId'],
        row['tabelaNome'],
        row['preco'],
        row['precoPromocional'],
        row['produtoId'],
        row['codigo'],
        row['empresaId'],
      );
      produto.add(produtoDetalhes);
    }

    return produto[0];
  }

  // Future<int> findDetalheProdutoIMG(String produtoId) async{
  //   final Database db = await getDatabase();
  //   await db.query('ProdutosImagen');
  //
  //   //TODO: ID da empresa logada
  //   final String idEmpresaLogada = await _empresaDao.findEmpresaPadrao(tipo: 'id');
  //
  //   final List<Map<String, dynamic>> result = await db.rawQuery(
  //       'SELECT '
  //           ' PI.imagem'
  //       ' FROM'
  //           ' Produtos P,'
  //           ' ProdutosEmpresa PES'
  //           ' LEFT JOIN ProdutosImagen PI ON PI.produtoId = p.id and PI.utilizar = 1'
  //        'WHERE'
  //           ' PES.empresaId = "$idEmpresaLogada"'
  //           ' AND P.id = "$produtoId"'
  //           ' ORDER BY PI.principal DESC'//TODO: Ordenando para retornar a principal primeiro
  //   );
  //   print('result ${result.runtimeType}');
  //   return 1;
  // }

  //TODO: Buscando todas as IMG do produto, pegando primeiro o true

  //TODO: Buscando todos o precos do produto

}















