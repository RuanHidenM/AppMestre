import 'package:appmestre/database/app_database.dart';
import 'package:appmestre/modelos/empresa.dart';
import 'package:sqflite/sqlite_api.dart';

class EmpresaDao {

  //TODO: Criação da tabela Empresa no SQLITE
  static const String tableSql =
      'CREATE TABLE Empresa('
      'id TEXT,'
      'nome TEXT,'
      'cpfcnpj TEXT,'
      'tenantid TEXT,'
      'padrao INTEGER)';

  //TODO: Salvando empresas do usuario
  Future<int> save(List<Empresa> empresa) async{
    for(int i = 0; i < empresa.length; i++ ){

      final Database db = await getDatabase();
      final Map<String, dynamic> empresaMap = Map();
      empresaMap['id'] = empresa[i].id;
      empresaMap['nome'] = empresa[i].nome;
      empresaMap['cpfcnpj'] = empresa[i].cpfCnpj;
      empresaMap['tenantid'] = empresa[i].tenantid;
      empresaMap['padrao'] = empresa[i].padrao;
      return db.insert('Empresa', empresaMap);
    }
    return 1;
  }

  //TODO:Buscando todos os dados
  Future<List<Empresa>> findEmpresa() async{
    final Database db = await getDatabase();
    await db.query('Empresa');
    final List<Map<String, dynamic>> result = await db.rawQuery('SELECT * FROM Empresa');
    final List<Empresa> empresas = [];

    for(Map<String, dynamic> row in result){
      final Empresa empresa = Empresa(
        row['id'],
        row['nome'],
        row['cpfcnpj'],
        row['tenantid'],
        row['padrao'],
      );
      empresas.add(empresa);
    }
   // print(empresas);
    return empresas;
  }

  //TODO: Buscando todos os nomes das empresas
  Future<List<String>> findNomeEmpresas() async{
    final Database db = await getDatabase();
    await db.query('Empresa');
    final List<Map<String, dynamic>> result = await db.rawQuery('SELECT * FROM Empresa');
    final List<String> nomeEmpresas = [];

    for(Map<String, dynamic> row in result){
      final nome = row['nome'];
      nomeEmpresas.add(nome);
    }
    //print('nomeEmpresas: $nomeEmpresas');
    return nomeEmpresas;
 }

  //TODO: Buscando a empresa que for Padrao do usuario
  //TODO tipo : tipo do retorno
  //TODO - nome  (retorna apenas o nome)
  Future<String> findEmpresaPadrao({required String tipo}) async{
    if(tipo == 'nome'){
      final Database db = await getDatabase();
      await db.query('Empresa');
      final List<Map<String, dynamic>> result = await db.rawQuery('SELECT * FROM Empresa WHERE padrao = 1');
      final List<String> nomeEmpresaPadrao = [];
      for(Map<String, dynamic> row in result){
        final nome = row['nome'];
        nomeEmpresaPadrao.add(nome);
      }
      final String nomeDaEmpresa = nomeEmpresaPadrao[0];
      return nomeDaEmpresa;
    }
    return 'Empresa null';
  }

  //TODO: Deletando todas as empresas
  Future<int> deleteEmpresa() async{
    final Database db = await getDatabase();
    return db.delete('Empresa');
  }

}