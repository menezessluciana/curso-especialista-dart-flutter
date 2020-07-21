
import 'package:dio/dio.dart';
import 'package:dart_avancado_desafio/models/cidade_model.dart';
import 'package:dart_avancado_desafio/models/estado_model.dart';

class IbgeRepository{

  Future<List<EstadoModel>> getStates() async{
     var url = 'https://servicodados.ibge.gov.br/api/v1/localidades/estados';
     var dio = Dio();
     var response = await dio.get(url);

     if(response.statusCode == 200){
       //é preciso converter pois o map sempre retorna dynamic
       var respData = response.data.map<EstadoModel>((e) => EstadoModel.fromMap(e)).toList();
       return respData;
     } else {
       return null;
     }

  }


  Future<List<CidadeModel>> getCities(int idUF) async{
     var url = 'https://servicodados.ibge.gov.br/api/v1/localidades/estados/${idUF.toString()}/distritos';
     var dio = Dio();

    var response = await dio.get(url);
    
    if(response.statusCode == 200){
      var respData = response.data.map<CidadeModel>((e) => CidadeModel.fromMap(e)).toList();
      return respData;
    } else {
      return null;
    }

  }
}