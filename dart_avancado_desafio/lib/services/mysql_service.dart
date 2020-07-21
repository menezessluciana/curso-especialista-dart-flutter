import 'package:dart_avancado_desafio/models/cidade_model.dart';
import 'package:dart_avancado_desafio/models/estado_model.dart';
import 'package:dart_avancado_desafio/repository/mysql_repository.dart';

class MySqlService {

  final _repository = MysqlRepository();

  Future<void> createTables() async {
       await _repository.createCityTable();
       await _repository.createStateTable();
       await _repository.createStateCityTable();
  }

  Future<void> addStates(List<EstadoModel> states) async {
       await _repository.addStates(states);
  }

  Future<void> addCities(List<CidadeModel> cities) async {
       await _repository.addCities(cities);
  }

  Future<void> addCitiesByState(List<CidadeModel> cities, int ufID) async {
       await _repository.addStatesCities(cities, ufID);
    }
  
  Future<dynamic> getAllCitiesByState() async {
    return _repository.getAllCitiesByState();
  }
}