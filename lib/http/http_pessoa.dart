import 'dart:convert';

import 'package:appmestre/database/dao/user_dao.dart';
import 'package:appmestre/http/intercept.dart';
import 'package:appmestre/modelos/usuario.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http/intercepted_client.dart';

class httpPessoa{
  final _userDao = UserDao();


  //TODO Retorno o interceptor do envio e o retorno do http do api
  Client client = InterceptedClient.build(interceptors: [LoggingInterceptor()]);


  //TODO URL da API MESTRE Pessoa
  var urlAuth = Uri.parse('http://10.0.2.2:5000/v1/pessoa');

  var tokenUsuarioLogado;
  var bearer;
  var headers;

  httpPessoa() {

      //TODO Pegando o token do usuario
    _userDao.findUsuario().then((value){
      tokenUsuarioLogado = value.token;

      bearer = tokenUsuarioLogado;

      //TODO: Detalhes do Headers
      headers = {
        'content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $bearer',
      };
    });
  }

  //TODO: Buscando os dados do /v1/pessoa
  Future<bool> findUsuario() async {
    //TODO : O envio de fato
    final Response responseGet =
        await client.get(urlAuth, headers: headers );
    print('statusCode pessoa: ${responseGet.statusCode}');


    //TODO O que for status code 401, retornar ao login com os dados apagados
    return true;
  }
}