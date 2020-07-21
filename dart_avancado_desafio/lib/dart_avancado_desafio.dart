import 'package:dart_avancado_desafio/services/ibge_service.dart';
import 'package:dart_avancado_desafio/services/mysql_service.dart';
import 'package:dio/dio.dart';

void run() async {
  try{
      final _ibgeService = IbgeService();
      final _mysqlService = MySqlService();

      await _mysqlService.createTables();
      var ufs = await _ibgeService.getStates();
      await _mysqlService.addStates(ufs);

      for(var uf in ufs){
        print('# Adicionando cidades do estado ${uf.nome}');
        var cities = await _ibgeService.getCities(uf.id);
        await _mysqlService.addCities(cities);
        await _mysqlService.addCitiesByState(cities, uf.id);
      }
         
      //# Exemplo de consulta de dados salvos no banco
      //  var resultado = await _mysqlService.getAllCitiesByState();
      //  resultado.forEach((r) => r[0] == 'São Paulo'? print('A cidade ${r[1]} pertence ao estado de SP') : null);
      } on DioError catch(e){
          print('DIO ERROR: $e');
      } catch(e){
          print('ERROR: $e');
      }
}