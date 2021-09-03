class ProdutoImagens{
  final String produtoId;
  final String imagem;
  final String extensao;
  final bool principal;
  final bool utilizar;
  final String url;

  ProdutoImagens(
      this.produtoId,
      this.imagem,
      this.extensao,
      this.principal,
      this.utilizar,
      this.url
      );

  @override
  String toString(){
    // TODO: implement toString
    return 'Imagens: '
           'produtoId $produtoId,'
           'imagem $imagem,'
           'extensao: $extensao,'
           'principal: $principal,'
           'utilizar: $utilizar,'
           'url: $url';
  }
}