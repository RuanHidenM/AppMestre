import 'dart:convert';
import 'package:appmestre/database/dao/empresa_dao.dart';
import 'package:appmestre/database/dao/user_dao.dart';
import 'package:appmestre/http/intercept.dart';
import 'package:appmestre/modelos/empresa.dart';
import 'package:appmestre/modelos/usuario.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';

//TODO: Buscando os dados de auth para o login, com informação passada
Future<bool> findUser(String email, String senha) async {
  String emaillogin = email;
  String senhalogin = senha;


  //TODO: Conectada com o UserDao
  final _userDao = UserDao();
  final _empresaDao = EmpresaDao();

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

    //TODO Informa dados ao modelo de Empresa
    final List<Empresa> empresas = [];
    //TODO Percorre todas as empresas retornadas para ser adicionadas no modelo EMPRESA
    for (int i = 0; i < validMap['empresas'].length; i++){
      final Empresa empresa = Empresa(
          validMap['empresas'][i]['id'],
          validMap['empresas'][i]['nome'],
          validMap['empresas'][i]['cpfCnpj'],
          validMap['empresas'][i]['tenantId'],
          validMap['empresas'][i]['padrao'] == true ? 1 : 0,
      );
      empresas.add(empresa);
    }

    // Empresa empresa = Empresa(
    //   validMap['empresas']['id'],
    //   validMap['empresas']['nome'],
    //   validMap['empresas']['cpfCnpj'],
    //   validMap['empresas']['tenantId'],
    //   validMap['empresas']['padrao'] == true ? 1 : 0,
    // );


    //Todo Gravando no sqlite os dados recuperados pela API MESTRE

      //TODO: Gravando na tabela usuario
      _userDao.save(usuario);

      //TODO: Gravando na tabela empresas
      _empresaDao.save(empresas);
       _empresaDao.findEmpresa();
       _empresaDao.findNomeEmpresas();
      _empresaDao.findEmpresaPadrao(tipo: 'nome');
      // print('empresa: ${empresas.runtimeType}');
  }
  //TODO: Retornando o resultado do login (true ou false)
  return await authenticated;
}
