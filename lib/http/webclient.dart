import 'dart:convert';
import 'package:appmestre/database/dao/user_dao.dart';
import 'package:appmestre/http/intercept.dart';
import 'package:appmestre/modelos/usuario.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';

//TODO: Buscando os dados de auth para o login, com informação passada
Future<bool> findUser(String email, String senha) async {
  String emaillogin = email;
  String senhalogin = senha;


  //TODO: Conectada com o UserDao
  final _userDao = UserDao();

  //TODO: Retornando o interceptor do envio e o retorno do http do api
  Client client = InterceptedClient.build(interceptors: [LoggingInterceptor()]);


  //TODO URL da API MESTRE
  var url = Uri.parse('http://10.0.2.2:5000/v1/auth');

  //TODO: Corpo de envio
  final body = jsonEncode({
    "email": "$emaillogin",
    "senha": "$senhalogin"
  });

  //TODO: Detalhes do Headers
  final headers = {'content-type': 'application/json'};

  //TODO: O envio de fato
  final Response responsePost =
      await client.post(url, body: body, headers: headers);

  //TODO recebendo os dados
  final validMap = json.decode(
    json.encode(
      json.decode(
        responsePost.body
      ),
    ),
  ) as Map<String, dynamic>;


  //TODO O retorno true ou false do login (true = tudo certo no login , false = erro no login)
  final authenticated = validMap['authenticated'];


  //TODO Se o login for True
  if(authenticated){
    //TODO Informando dados ao modelo Usuario
    Usuario usuario = Usuario(
      validMap['usuario']['id'],
      validMap['usuario']['nome'],
      validMap['usuario']['email'],
      validMap['usuario']['tenantId'],
      validMap['token'],
    );
    _userDao.save(usuario);
    _userDao.findUsuario();
  }
  //TODO: Retornando o resultado do login (true ou false)
  return await authenticated;
}
