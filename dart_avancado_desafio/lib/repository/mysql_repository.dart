import 'package:dart_avancado_desafio/models/cidade_model.dart';
import 'package:dart_avancado_desafio/models/estado_model.dart';
import 'package:mysql1/mysql1.dart';

class MysqlRepository {

  Future<MySqlConnection> getConnection() async{
    var settings =  ConnectionSettings(
    host: 'localhost', 
    port: 3306,
    user: 'root',
    password: 'root',
    db: 'desafiodartavancado'
  );
    return await MySqlConnection.connect(settings);
  }

  Future<void> createCityTable() async{
    var conn = await getConnection();
    await conn.query(
      'CREATE TABLE city (id int NOT NULL PRIMARY KEY, nome varchar(50))');
    await conn.close();
    }

  Future<void> createStateTable() async{
    var conn = await getConnection();
    await conn.query(
      'CREATE TABLE state (id int NOT NULL PRIMARY KEY, nome varchar(50), sigla varchar(3))');
      await conn.close();
    }

    Future<void> createStateCityTable() async{
    var conn = await getConnection();
    await conn.query('''
      CREATE TABLE state_city(
        state_id int,
        city_id int,
        foreign key(state_id) references state(id),
        foreign key(city_id) references city(id))''');
    await conn.close();
    }

    Future<void> addStates(List<EstadoModel> states) async{
      var conn = await getConnection();
      for(var state in states){
         await conn.query('insert into state values(?,?,?)', [state.id, state.nome, state.sigla]);
      }
      await conn.close();
    }

    Future<void> addCities(List<CidadeModel> cities) async{
          var conn = await getConnection();
      for(var city in cities){
         await conn.query('insert into city values(?,?)', [city.id, city.nome]);
      }
      await conn.close();
    }

    Future<void> addStatesCities(List<CidadeModel> cities, int ufID) async{
       var conn = await getConnection();
       for(var city in cities){
         await conn.query('insert into state_city values(?,?)', [ufID, city.id]);
      }
      await conn.close();
    }

    Future<dynamic> getAllCitiesByState() async {
       var conn = await getConnection();
       var resultado = await conn.query('''
          select s.nome, c.nome from state s
          inner join state_city sc on sc.state_id = s.id
          inner join city c on sc.city_id = c.id;
       ''');
        await conn.close();
        return resultado;
    }
  }