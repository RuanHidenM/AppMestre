class ProdutoEmpresa{

  final String produtoId;
  final String empresaId;
  final int cstOrigem;
  final int cstIcms;
  final int indicadorProducao;
  final int tipo;

  ProdutoEmpresa(
      this.produtoId,
      this.empresaId,
      this.cstOrigem,
      this.cstIcms,
      this.indicadorProducao,
      this.tipo,
      );

  @override
  String toString(){
    // TODO: implement toString
    return
      'ProdutoEstoque -'
      'produtoId $produtoId,'
      'empresaId $empresaId,'
      'cstOrigem $cstOrigem,'
      'cstIcms $cstIcms,'
      'indicadorProducao $indicadorProducao,'
      'tipo $tipo,';

  }
}