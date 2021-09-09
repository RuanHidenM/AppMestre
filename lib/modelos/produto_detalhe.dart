class ProdutoDetalhe{

 final String Produtoreferencia;
 final String Produtosku;
 final String Produtodescricao;
 final String Produtocomplemento;
 final String ProdutoncmId;
 final String Produtoabreviacao;
 final String Produtogarantia;
 final String Produtoobservacao;
 final String ProdutomargemLucro;
 final String ProdutopisCofinsCreditos;
 final String ProdutocestCodigo;
 final String ProdutoanpCodigo;
 final String ProdutoregistroAnvisa;
 final String Produtodetalhes;
 final String Produtoid;
 final String ProdutocadastroUsuarioId;
 final String ProdutocadastroUsuarioNome;
 final String ProdutocadastroData;
 final String ProdutoalteracaoUsuarioId;
 final String ProdutoalteracaoUsuarioNome;
 final String ProdutoalteracaoData;
 final String ProdutodescricaoView;

 final String EstoquesprodutoId;
 final String EstoquesempresaId;
 final double EstoquesquantidadeSaldo;
 final double EstoquesquantidadeMinima;
 final double EstoquesquantidadeMaxima;
 final double EstoquescustoLiquido;
 final double EstoquescustoFornecedor;
 final double EstoquescustoMedio;
 final double EstoquesicmsStBcRet;
 final double EstoquesicmsStVlRet;
 final double EstoquesicmsStPrRet;
 final double EstoquesicmsVlSubstituto;
 final double Estoquesau;

 final String EmpresasprodutoId;
 final String EmpresasempresaId;
 final int EmpresascstOrigem;
 final int EmpresascstIcms;
 final int EmpresasindicadorProducao;
 final int Empresastipo;

 final String PrecosprodutoId;
 final String PrecostabelaId;
 final String PrecostabelaNome;
 final double Precospreco;
 final double PrecosprecoPromocional;

 final String CodigoBarrasprodutoId;
 final String CodigoBarrascodigo;
 final String CodigoBarrasempresaId;

  ProdutoDetalhe(
      this.Produtoreferencia,
      this.Produtosku,
      this.Produtodescricao,
      this.Produtocomplemento,
      this.ProdutoncmId,
      this.Produtoabreviacao,
      this.Produtogarantia,
      this.Produtoobservacao,
      this.ProdutomargemLucro,
      this.ProdutopisCofinsCreditos,
      this.ProdutocestCodigo,
      this.ProdutoanpCodigo,
      this.ProdutoregistroAnvisa,
      this.Produtodetalhes,
      this.Produtoid,
      this.ProdutocadastroUsuarioId,
      this.ProdutocadastroUsuarioNome,
      this.ProdutocadastroData,
      this.ProdutoalteracaoUsuarioId,
      this.ProdutoalteracaoUsuarioNome,
      this.ProdutoalteracaoData,
      this.ProdutodescricaoView,
      this.EstoquesprodutoId,
      this.EstoquesempresaId,
      this.EstoquesquantidadeSaldo,
      this.EstoquesquantidadeMinima,
      this.EstoquesquantidadeMaxima,
      this.EstoquescustoLiquido,
      this.EstoquescustoFornecedor,
      this.EstoquescustoMedio,
      this.EstoquesicmsStBcRet,
      this.EstoquesicmsStVlRet,
      this.EstoquesicmsStPrRet,
      this.EstoquesicmsVlSubstituto,
      this.Estoquesau,
      this.EmpresasprodutoId,
      this.EmpresasempresaId,
      this.EmpresascstOrigem,
      this.EmpresascstIcms,
      this.EmpresasindicadorProducao,
      this.Empresastipo,
      this.PrecosprodutoId,
      this.PrecostabelaId,
      this.PrecostabelaNome,
      this.Precospreco,
      this.PrecosprecoPromocional,
      this.CodigoBarrasprodutoId,
      this.CodigoBarrascodigo,
      this.CodigoBarrasempresaId,
      );

  String toString(){
    return 'Detalhes do Produto - '
        'Produtoreferencia,: $Produtoreferencia,'
        'Produtosku,: $Produtosku,'
        'Produtodescricao,: $Produtodescricao,'
        'Produtocomplemento,: $Produtocomplemento,'
        'ProdutoncmId,: $ProdutoncmId,'
        'Produtoabreviacao,: $Produtoabreviacao,'
        'Produtogarantia,: $Produtogarantia,'
        'Produtoobservacao,: $Produtoobservacao,'
        'ProdutomargemLucro,: $ProdutomargemLucro,'
        'ProdutopisCofinsCreditos,: $ProdutopisCofinsCreditos,'
        'ProdutocestCodigo,: $ProdutocestCodigo,'
        'ProdutoanpCodigo,: $ProdutoanpCodigo,'
        'ProdutoregistroAnvisa,: $ProdutoregistroAnvisa,'
        'Produtodetalhes,: $Produtodetalhes,'
        'Produtoid,: $Produtoid,'
        'ProdutocadastroUsuarioId,: $ProdutocadastroUsuarioId,'
        'ProdutocadastroUsuarioNome,: $ProdutocadastroUsuarioNome,'
        'ProdutocadastroData,: $ProdutocadastroData,'
        'ProdutoalteracaoUsuarioId,: $ProdutoalteracaoUsuarioId,'
        'ProdutoalteracaoUsuarioNome,: $ProdutoalteracaoUsuarioNome,'
        'ProdutoalteracaoData,: $ProdutoalteracaoData,'
        'ProdutodescricaoView,: $ProdutodescricaoView,'
        'EstoquesprodutoId,: $EstoquesprodutoId,'
        'EstoquesempresaId,: $EstoquesempresaId,'
        'EstoquesquantidadeSaldo,: $EstoquesquantidadeSaldo,'
        'EstoquesquantidadeMinima,: $EstoquesquantidadeMinima,'
        'EstoquesquantidadeMaxima,: $EstoquesquantidadeMaxima,'
        'EstoquescustoLiquido,: $EstoquescustoLiquido,'
        'EstoquescustoFornecedor,: $EstoquescustoFornecedor,'
        'EstoquescustoMedio,: $EstoquescustoMedio,'
        'EstoquesicmsStBcRet,: $EstoquesicmsStBcRet,'
        'EstoquesicmsStVlRet,: $EstoquesicmsStVlRet,'
        'EstoquesicmsStPrRet,: $EstoquesicmsStPrRet,'
        'EstoquesicmsVlSubstituto,: $EstoquesicmsVlSubstituto,'
        'Estoquesau,: $Estoquesau,'
        'EmpresasprodutoId,: $EmpresasprodutoId,'
        'EmpresasempresaId,: $EmpresasempresaId,'
        'EmpresascstOrigem,: $EmpresascstOrigem,'
        'EmpresascstIcms,: $EmpresascstIcms,'
        'EmpresasindicadorProducao,: $EmpresasindicadorProducao,'
        'Empresastipo,: $Empresastipo,'
        'PrecosprodutoId,: $PrecosprodutoId,'
        'PrecostabelaId,: $PrecostabelaId,'
        'PrecostabelaNome,: $PrecostabelaNome,'
        'Precospreco,: $Precospreco,'
        'PrecosprecoPromocional,: $PrecosprecoPromocional,'
        'CodigoBarrasprodutoId,: $CodigoBarrasprodutoId,'
        'CodigoBarrascodigo,: $CodigoBarrascodigo,'
        'CodigoBarrasempresaId,: $CodigoBarrasempresaId,';
  }

}

