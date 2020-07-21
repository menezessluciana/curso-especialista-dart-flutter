import 'package:dart_avancado_desafio/models/cidade_model.dart';
import 'package:dart_avancado_desafio/models/estado_model.dart';
import 'package:dart_avancado_desafio/repository/ibge_repository.dart';

class IbgeService {
 final _repository = IbgeRepository();

 Future<List<EstadoModel>> getStates() {
     return _repository.getStates();
  }

  Future<List<CidadeModel>> getCities(int idUF) async{
     return  _repository.getCities(idUF);
  }
}