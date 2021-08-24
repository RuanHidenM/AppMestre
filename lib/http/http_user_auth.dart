import 'dart:convert';
import 'package:appmestre/database/dao/empresa_dao.dart';
import 'package:appmestre/database/dao/user_dao.dart';
import 'package:appmestre/http/intercept.dart';
import 'package:appmestre/modelos/empresa.dart';
import 'package:appmestre/modelos/usuario.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';

class httpUserAuth{
  //TODO: Retornando o interceptor do envio e o retorno do http do api
  Client client = InterceptedClient.build(interceptors: [LoggingInterceptor()]);

  //TODO URL da API MESTRE
  var urlAuth = Uri.parse('https://api.mestreceo.com/v1/auth');

  //TODO: Conectada com o UserDao
  final _userDao = UserDao();
  //TODO: Conectada com o EmpresaDao
  final _empresaDao = EmpresaDao();

  //TODO: Detalhes do Headers
  final headers = {'content-type': 'application/json'};

  //TODO: Buscando os dados de auth para o login, com informação passada
  Future<bool> findUser(String email, String senha) async {
    String emaillogin = email;
    String senhalogin = senha;

    //TODO: Corpo de envio
    final body = jsonEncode({
      "email": "$emaillogin",
      "senha": "$senhalogin"
    });

    //TODO: O envio de fato
    final Response responsePost =
    await client.post(urlAuth, body: body, headers: headers);

    //TODO recebendo os dados
    final validMap = json.decode(
      json.encode(
        json.decode(
            responsePost.body
        ),
      ),
    ) as Map<String, dynamic>;

    //TODO: O retorno true ou false do login
    //TODO: (true = tudo certo no login
    //TODO: false = erro no login)
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

      //TODO: Gravando na tabela usuario
      _userDao.save(usuario);

      //TODO: Gravando na tabela empresas
      _empresaDao;
      _empresaDao.save(empresas);
      _empresaDao.findEmpresa();
      _empresaDao.findNomeEmpresas();
      _empresaDao.findEmpresaPadrao(tipo: 'nome');
      // print('empresa: ${empresas.runtimeType}');
    }
    //TODO: Retornando o resultado do login (true ou false)
    return await authenticated;
  }
}

