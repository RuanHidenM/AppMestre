class ProdutoCodigoBarra{
  final String produtoId;
  final String codigo;
  final String empresaId;

  ProdutoCodigoBarra(
      this.produtoId,
      this.codigo,
      this.empresaId,
      );

  @override
  String toString(){
    //TODO Implement toString
    return 'Codigo Barras:'
            'ProdutoId $produtoId,'
            'Codigo $codigo,'
            'empresaId $empresaId';
  }
}