class ProdutoCard{
 final String produtoId;
 final String nome;
 final double valor;
 final double estoque;
 final String imagem;

 ProdutoCard(
     this.produtoId,
     this.nome,
     this.valor,
     this.estoque,
     this.imagem
     );

  @override
  String toString(){
    //TODO Implement toString
    return 'Produto Card - '
        'id: $produtoId,'
        'nome: $nome,'
        'valor: $valor,'
        'estoque: $estoque,'
        'imagen: $imagem';
  }
}