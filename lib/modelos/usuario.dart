class Usuario{
  final String id;
  final String nome;
  final String email;
  final String tenantid;
  final String token;
  Usuario(
      this.id,
      this.nome,
      this.email,
      this.tenantid,
      this.token,
      );

  @override
  String toString() {
    // TODO: implement toString
    return ' id: $id,'
           ' nome: $nome,'
           ' email: $email,'
           ' tenantid: $tenantid,'
           ' token: $token';
  }
}