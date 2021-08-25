//TODO Calcula porcentagem Entre dois valores

//TODO Para calcular a procentagem de um valor em relação ao outro(ValorVariavel / ValorTotal * 100 = N%)
calcularPorcentagemEntreDoisValores({double subValor = 0, double total = 0}){
  //TODO DIVISÃO
  double valorDividido = subValor / total;

  //TODO MULTIPLICA
  double valorMultiplica = valorDividido * 100;
  return valorMultiplica.toStringAsFixed(1);

}