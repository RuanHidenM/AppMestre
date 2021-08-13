import 'dart:convert';
import 'package:appmestre/http/intercept.dart';
import 'package:appmestre/modelos/userauth.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';

//TODO: Buscando os dados de auth para o login, com informação passada
Future<bool> findUser(
  String tenant,
  String nome,
  String senha,
  ) async {
  String tenantRef = tenant;
  String nomelogin = nome;
  String senhalogin = senha;

  //TODO: Retornando o interceptor do envio e o retorno do http do api
  Client client = InterceptedClient.build(interceptors: [LoggingInterceptor()]);

  var url = Uri.parse('http://api.mestreceo.com/v1/auth');

  final body = jsonEncode({
    "tenantRef": "$tenantRef",
    "nomeUsuario": "$nomelogin",
    "senha": "$senhalogin"
  });

  final headers = {'content-type': 'application/json'};

  final Response responsePost =
      await client.post(url, body: body, headers: headers);

  final validMap = json.decode(json.encode(json.decode(responsePost.body)))
      as Map<String, dynamic>;

  final authenticated = validMap['authenticated'];

  if(authenticated){
    UserLog userAuth = UserLog(
      validMap['authenticated'],
      validMap['created'],
      validMap['expiration'],
      validMap['token'],
      validMap['message'],
      validMap['usuario']['nome'],
      validMap['tenant']['nome'],
      validMap['empresa']['nome'],
    );
   // print(userAuth.toString());
  }

  //print('retorno do login: $authenticated');
  return await authenticated;
}
