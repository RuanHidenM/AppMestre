class ProdutoEstoques{
  final String produtoId;
  final String empresaId;
  final double quantidadeSaldo;
  final double quantidadeMinima;
  final double quantidadeMaxima;
  final double custoLiquido;
  final double custoFornecedor;
  final double custoMedio;
  final double icmsStBcRet;
  final double icmsStVlRet;
  final double icmsStPrRet;
  final double icmsVlSubstituto;
  final double au;

  ProdutoEstoques(
        this.produtoId,
        this.empresaId,
        this.quantidadeSaldo,
        this.quantidadeMinima,
        this.quantidadeMaxima,
        this.custoLiquido,
        this.custoFornecedor,
        this.custoMedio,
        this.icmsStBcRet,
        this.icmsStVlRet,
        this.icmsStPrRet,
        this.icmsVlSubstituto,
        this.au,
    );

  @override
  String toString(){
    // TODO: implement toString
    return 
      'ProdutoEstoque:'
      'produtoId $produtoId,'
      'empresaId $empresaId,'
      'quantidadeSaldo $quantidadeSaldo,'
      'quantidadeMinima $quantidadeMinima,'
      'quantidadeMaxima $quantidadeMaxima,'
      'custoLiquido $custoLiquido,'
      'custoFornecedor $custoFornecedor,'
      'custoMedio $custoMedio,'
      'icmsStBcRet $icmsStBcRet,'
      'icmsStVlRet $icmsStVlRet,'
      'icmsStPrRet $icmsStPrRet,'
      'icmsVlSubstituto $icmsVlSubstituto,'
      'au $au,';
  }
}