
//TODO: Recebe um numero INT e um text String
//TODO: O numero vai determinar quantas palavas o script pegara no Text informado
resumoText(int numeroQuantidade, String text, ){
  String textResult = '';

  for(int i = 0; i < numeroQuantidade; i++ ){
    textResult = '$textResult ${text.split(' ')[i]}';
  }
  return '$textResult';
}