import 'package:appmestre/modelos/produto_codigo_barra.dart';
import 'package:appmestre/modelos/produto_empresa.dart';
import 'package:appmestre/modelos/produto_estoques.dart';
import 'package:appmestre/modelos/produto_imagens.dart';
import 'package:appmestre/modelos/produto_preco.dart';

class Produto{
  final String referencia;
  final String sku;
  final String descricao;
  final String complemento;
  final String ncmId;
  final String abreviacao;
  final String garantia;
  final String observacao;
  final String margemLucro;
  final String pisCofinsCreditos;
  final String cestCodigo;
  final String anpCodigo;
  final String registroAnvisa;
  final String detalhes;
  final String id;
  final String cadastroUsuarioId;
  final String cadastroUsuarioNome;
  final String cadastroData;
  final String alteracaoUsuarioId;
  final String alteracaoUsuarioNome;
  final String alteracaoData;
  final String descricaoView;

  Produto(
    this.referencia,
    this.sku,
    this.descricao,
    this.complemento,
    this.ncmId,
    this.abreviacao,
    this.garantia,
    this.observacao,
    this.margemLucro,
    this.pisCofinsCreditos,
    this.cestCodigo,
    this.anpCodigo,
    this.registroAnvisa,
    this.detalhes,
    this.id,
    this.cadastroUsuarioId,
    this.cadastroUsuarioNome,
    this.cadastroData,
    this.alteracaoUsuarioId,
    this.alteracaoUsuarioNome,
    this.alteracaoData,
    this.descricaoView,
  );

  @override
  String toString(){
    return 'Produto - '
        'referencia: $referencia,'
        'sku: $sku,'
        'descricao: $descricao,'
        'complemento: $complemento,'
        'ncmId: $ncmId,'
        'abreviacao: $abreviacao,'
        'garantia: $garantia,'
        'observacao: $observacao,'
        'margemLucro: $margemLucro,'
        'pisCofinsCreditos: $pisCofinsCreditos,'
        'cestCodigo: $cestCodigo,'
        'anpCodigo: $anpCodigo,'
        'registroAnvisa: $registroAnvisa,'
        'detalhes: $detalhes,'
        'id: $id,'
        'cadastroUsuarioId: $cadastroUsuarioId,'
        'cadastroUsuarioNome: $cadastroUsuarioNome,'
        'cadastroData: $cadastroData,'
        'alteracaoUsuarioId: $alteracaoUsuarioId,'
        'alteracaoUsuarioNome: $alteracaoUsuarioNome,'
        'alteracaoData: $alteracaoData,'
        'descricaoView: $descricaoView';
  }

}