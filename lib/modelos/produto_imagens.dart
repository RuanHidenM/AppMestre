class ProdutoImagen{
  final String produtoId;
  final String imagem;
  final String extensao;
  final int principal; //TODO: boolean, int para se gravado no sqflite
  final int utilizar; //TODO: boolean, int para se gravado no sqflite
  final String url;

  ProdutoImagen(
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