class ProdutoPreco{
  final String produtoId;
  final String tabelaId;
  final String tabelaNome;
  final double preco;
  final double precoPromocional;

  ProdutoPreco(
     this.produtoId,
     this.tabelaId,
     this.tabelaNome,
     this.preco,
     this.precoPromocional,
  );

  @override
  String toString(){
    //TODO: Implement toString
    return 'Preco :'
           'produtoId: $produtoId,'
           'tabelaId: $tabelaId,'
           'tabelaNome: $tabelaNome,'
           'preco: $preco,'
           'precoPromocional: $precoPromocional';
  }

}
