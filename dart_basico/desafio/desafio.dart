void main(List<String> args) {
  var pacientes = [
    'Rodrigo Rahman|35|desenvolvedor|SP',
    'Manoel Silva|12|estudante|MG',
    'Joaquim Rahman|18|estudante|SP',
    'Fernando Verne|35|estudante|MG',
    'Gustavo Silva|40|estudante|MG',
    'Sandra Silva|40|estudante|MG',
    'Regina Verne|35|estudante|MG',
    'João Rahman|55|Jornalista|SP',
  ];


  // Baseado no array acima monte um relatório onde mostre
  // Apresente a quantidade de pacientes com mais de 20 anos
  // Agrupar os pacientes por familia(considerar o sobrenome) apresentar por familia.


  List<List<String>> pacientesSplited = [];

  //* Com for
  // for(int i=0; i<pacientes.length; i++){
  //   pacientesSplited.add(pacientes[i].split('|'));
  // }

  //* Com for in
  for(var paciente in pacientes){
    pacientesSplited.add(paciente.split('|'));
  }

  int count=0;
   for(int i=0; i<pacientesSplited.length; i++){
    if(int.tryParse(pacientesSplited[i][1])> 20) {
      count++; 
    }
  }

  print('Pacientes com mais de 20 anos: $count');

  Map<String, List<String>> families = {};
  families['Rahman'] = [];
  families['Silva'] = [];
  families['Verne'] = [];

   for(int i=0; i<pacientesSplited.length; i++){
    if(pacientesSplited[i][0].contains('Verne')) {
      families['Verne'].add(pacientesSplited[i][0].substring(0, pacientesSplited[i][0].indexOf(' ')));
    }
     if(pacientesSplited[i][0].contains('Silva')) {
      families['Silva'].add(pacientesSplited[i][0].substring(0, pacientesSplited[i][0].indexOf(' '))); 
    }
     if(pacientesSplited[i][0].contains('Rahman')) {
      families['Rahman'].add(pacientesSplited[i][0].substring(0, pacientesSplited[i][0].indexOf(' ')));
    }
  }


  families.forEach((key, value) {
    print('Família $key:');
    for (var pessoa in value) {
      print('$pessoa');
    }
    print('\n');
  });

}