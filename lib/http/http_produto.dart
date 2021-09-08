import 'dart:convert';

import 'package:appmestre/database/dao/card_produto.dart';
import 'package:appmestre/database/dao/produto_codigo_barra_dao.dart';
import 'package:appmestre/database/dao/produto_empresa_dao.dart';
import 'package:appmestre/database/dao/produto_estoque_dao.dart';
import 'package:appmestre/database/dao/produto_dao.dart';
import 'package:appmestre/database/dao/produto_imagen_dao.dart';
import 'package:appmestre/database/dao/produto_preco_dao.dart';
import 'package:appmestre/database/dao/user_dao.dart';
import 'package:appmestre/http/intercept.dart';
import 'package:appmestre/modelos/produto.dart';
import 'package:appmestre/modelos/produto_codigo_barra.dart';
import 'package:appmestre/modelos/produto_empresa.dart';
import 'package:appmestre/modelos/produto_estoques.dart';
import 'package:appmestre/modelos/produto_imagens.dart';
import 'package:appmestre/modelos/produto_preco.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';

  //TODO: Connectando com o usuario
  final _userDao = UserDao();

  //TODO: Conectada com o EmpresaDao
  final _produtoDao = ProdutoDao();

  //TODO: Conectada com o ProdutoEstoqueDao
  final _produtoEstoqueDao = ProdutoEstoqueDao();

  //TODO: Conectada com o ProdutoEstoqueDao
  final _produtoEmpresaDao = ProdutoEmpresaDao();

  //TODO: Conectada com o ProdutoPreco
  final _produtoPrecoDao = ProdutoPrecoDao();

  //TODO: Conectando com o ProdutoImagen
  final _produtoImagenDao = ProdutoImagenDao();

  //TODO: Conectando com o ProdutoImagen
  final _produtoCodigoBarraDao = ProdutoCodigoBarraDao();

  //TODO Card do Produto
  final _cardProdutoDao = CardProdutoDao();



Future<String> httpProduto() async {

  //TODO: Retornado o interceptro do encio e o retorno do http
  Client client = InterceptedClient.build(interceptors: [LoggingInterceptor()]);

  //TODO URL da API MESTRE
  var urlProduto = Uri.parse('https://api.mestreceo.com/v1/produto');

  //TODO: Pegando o token do Produto
  var bearer = await _userDao.findUsuario().then((value) => value.token);

  //TODO Contruindo o header da consulta Get
  var headers = {
    'content-type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer $bearer',
  };

  //TODO: Fazendo a conecção de fato
  final Response responsePost = await client.get(urlProduto, headers: headers);
  //print('statusCode produto: ${response.statusCode}');
  // if(response.statusCode == 401) return false;
  // return true;

  //TODO recebendo os dados
  var validMap = json.decode(
    json.encode(
      json.decode(
          responsePost.body
      ),
    ),
  );

  final List<Produto> produtos = [];
  final List<ProdutoEstoques> produtoEstoques = [];
  final List<ProdutoEmpresa> produtoEmpresas = [];
  final List<ProdutoPreco> produtoPrecos = [];
  final List<ProdutoImagen> produtoImagens = [];
  final List<ProdutoCodigoBarra> produtoCodigoBarras = [];

  //TODO: Listando Produto
  for (int i = 0; i < validMap.length; i++) {
    Produto produto = Produto(
      validMap[i]['referencia'] ?? '',
      validMap[i]['sku'] ?? '',
      validMap[i]['descricao'] ?? '',
      validMap[i]['complemento'] ?? '',
      validMap[i]['ncmId'] ?? '',
      validMap[i]['abreviacao'] ?? '',
      validMap[i]['garantia'] ?? '',
      validMap[i]['observacao'] ?? '',
      validMap[i]['margemLucro'] ?? '',
      validMap[i]['pisCofinsCreditos'] ?? '',
      validMap[i]['cestCodigo'] ?? '',
      validMap[i]['anpCodigo'] ?? '',
      validMap[i]['registroAnvisa'] ?? '',
      validMap[i]['detalhes'] ?? '',
      validMap[i]['id'] ?? '',
      validMap[i]['cadastroUsuarioId'] ?? '',
      validMap[i]['cadastroUsuarioNome'] ?? '',
      validMap[i]['cadastroData'] ?? '',
      validMap[i]['alteracaoUsuarioId'] ?? '',
      validMap[i]['alteracaoUsuarioNome'] ?? '',
      validMap[i]['alteracaoData'] ?? '',
      validMap[i]['descricaoView'] ?? '',

    );
    produtos.add(produto);

    //TODO Formando os modelos de Estoque
    for (int iest = 0; iest < validMap[i]['estoques'].length; iest++) {
      ProdutoEstoques produtoestoque = ProdutoEstoques(
        validMap[i]['estoques'][iest]['produtoId'],
        validMap[i]['estoques'][iest]['empresaId'],
        validMap[i]['estoques'][iest]['quantidadeSaldo'],
        validMap[i]['estoques'][iest]['quantidadeMinima'],
        validMap[i]['estoques'][iest]['custoLiquido'],
        validMap[i]['estoques'][iest]['custoLiquido'],
        validMap[i]['estoques'][iest]['custoFornecedor'],
        validMap[i]['estoques'][iest]['custoMedio'],
        validMap[i]['estoques'][iest]['icmsStBcRet'],
        validMap[i]['estoques'][iest]['icmsStVlRet'],
        validMap[i]['estoques'][iest]['icmsStPrRet'],
        validMap[i]['estoques'][iest]['icmsVlSubstituto'],
        validMap[i]['estoques'][iest]['au'],
      );
      produtoEstoques.add(produtoestoque);
    }

    //TODO: Formando os modelos de Empresas
    for (int iemp = 0; iemp < validMap[i]['empresas'].length; iemp++) {
      ProdutoEmpresa produtoEmpresa = ProdutoEmpresa(
        validMap[i]['empresas'][iemp]['produtoId'],
        validMap[i]['empresas'][iemp]['empresaId'],
        validMap[i]['empresas'][iemp]['cstOrigem'],
        validMap[i]['empresas'][iemp]['cstIcms'],
        validMap[i]['empresas'][iemp]['indicadorProducao'],
        validMap[i]['empresas'][iemp]['tipo'],
      );
      produtoEmpresas.add(produtoEmpresa);
    }

    //TODO: Formando os modelos de Preco
    for (int iprec = 0; iprec < validMap[i]['precos'].length; iprec++) {
      ProdutoPreco produtoPreco = ProdutoPreco(
        validMap[i]['precos'][iprec]['produtoId'],
        validMap[i]['precos'][iprec]['tabelaId'],
        validMap[i]['precos'][iprec]['tabelaNome'],
        validMap[i]['precos'][iprec]['preco'],
        validMap[i]['precos'][iprec]['precoPromocional'] ?? 0.0,
      );
      produtoPrecos.add(produtoPreco);
    }

    //TODO: Formando os modelos de Imagens
    for(int iimg = 0; iimg < validMap[i]['imagens'].length; iimg++){
      ProdutoImagen produtoImagen = ProdutoImagen(
        validMap[i]['imagens'][iimg]['produtoId'],
        validMap[i]['imagens'][iimg]['imagem'],
        validMap[i]['imagens'][iimg]['extensao'],
        validMap[i]['imagens'][iimg]['principal'] == true ? 1 : 0,
        validMap[i]['imagens'][iimg]['utilizar'] == true ? 1 : 0,
        validMap[i]['imagens'][iimg]['url'] ?? '',
      );
      produtoImagens.add(produtoImagen);
    }

    //TODO: Formando os modelos de CodigoBarras
    for(int icodigo = 0; icodigo < validMap[i]['codigoBarras'].length; icodigo++){
      ProdutoCodigoBarra produtoCodigoBarra = ProdutoCodigoBarra(
          validMap[i]['codigoBarras'][icodigo]['produtoId'],
          validMap[i]['codigoBarras'][icodigo]['codigo'],
          validMap[i]['codigoBarras'][icodigo]['empresaId'],
      );
      produtoCodigoBarras.add(produtoCodigoBarra);
    }
  }

  //TODO: Produto
  _produtoDao;
  //_produtoDao.save(produtos);
  //_produtoDao.findProduto();

  //TODO: Produto Estoque
  _produtoEstoqueDao;
  //_produtoEstoqueDao.save(produtoEstoques);
  //_produtoEstoqueDao.findProdutoEstoque();

  //TODO Produto Empresa
  _produtoEmpresaDao;
  //_produtoEmpresaDao.save(produtoEmpresas);
  //_produtoEmpresaDao.findProdutoEmpresa();

  //TODO: Produto Preco
  _produtoPrecoDao;
  //_produtoPrecoDao.save(produtoPrecos);
  //_produtoPrecoDao.findProdutopreco();

  //TODO: Produto Imagen
  _produtoImagenDao;
  //_produtoImagenDao.save(produtoImagens);
  //_produtoImagenDao.findProdutoImagen();

  //TODO: Produto Codigo Barras
  _produtoCodigoBarraDao;
  //_produtoCodigoBarraDao.save(produtoCodigoBarras);
  //_produtoCodigoBarraDao.findProdutoCodigoBarra();

  _cardProdutoDao.findCardProduto();

  return '${validMap[0]['imagens']}';
}

Future<int> DeletaTudoProduto()async{
  _produtoDao.deleteProduto();
  _produtoEstoqueDao.deleteProdutoEmpresa();
  _produtoEmpresaDao.deleteProdutoEmpresa();
  _produtoPrecoDao.deleteProdutoPreco();
  _produtoImagenDao.deleteProdutoImagen();
  _produtoCodigoBarraDao.deleteCodigoBarra();
  print('Todos deletados !!');
  return 1;
}


