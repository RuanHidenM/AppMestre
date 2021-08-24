
import 'package:appmestre/database/dao/empresa_dao.dart';
import 'package:appmestre/database/dao/user_dao.dart';
import 'package:appmestre/http/intercept.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http/intercepted_client.dart';


Future<bool> VerificaTokenUser() async{
  final _userDao = UserDao();

  //TODO: Retorno o interceptor do envio e o retorno do http do api
  Client client = InterceptedClient.build(interceptors: [LoggingInterceptor()]);

  //TODO: URL da API MESTRE /pessoa
  var urlAuth = Uri.parse('https://api.mestreceo.com/v1/pessoa');

  //TODO: Pegando o token do usuario logado
  var bearer = await _userDao.findUsuario().then((value) => value.token);

  //TODO: Contruindo o header da consulta GET
  var headers = {
    'content-type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer $bearer',
  };

  //TODO: Fazendo a conecção de fato
    final Response responseGet =
    await client.get(urlAuth, headers: headers );
    print('statusCode pessoa: ${responseGet.statusCode}');

    if(responseGet.statusCode == 401) return false;

  return true;
}