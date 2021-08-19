class Empresa{
  final String id;
  final String nome;
  final String cpfCnpj;
  final String tenantid;
  final int padrao;

  Empresa(
      this.id,
      this.nome,
      this.cpfCnpj,
      this.tenantid,
      this.padrao
      );

  @override
  String toString(){
    // TODO: implement toString
    return 'Empresas: id $id,'
            'nome: $nome,'
            'cpfcnpj: $cpfCnpj,'
            'tenantid: $tenantid,'
            'padrao: $padrao';
  }
}