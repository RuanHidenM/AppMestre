class UserLog{
  final bool authenticated;
  final String created;
  final String expiration;
  final String token;
  final String message;
  final String usuarionome;
  final String tenantnome;
  final String empresanome;

  UserLog(
      this.authenticated,
      this.created,
      this.expiration,
      this.token,
      this.message,
      this.usuarionome,
      this.tenantnome,
      this.empresanome
      );

  @override
  String toString() {
    // TODO: implement toString
    return ' authenticated: $authenticated,'
           ' created: $created,'
           ' expiration: $expiration,'
           ' token: $token,'
           ' message: $message,'
           ' usuarionome: $usuarionome,'
           ' tenantnome: $tenantnome,'
           ' empresanome $empresanome ';
  }
}