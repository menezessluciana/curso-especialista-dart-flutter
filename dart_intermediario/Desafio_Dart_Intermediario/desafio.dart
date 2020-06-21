
main(List<String> args) {
  var pessoas = [
    'Rodrigo Rahman|35|Masculino',
    'Jose|56|Masculino',
    'Joaquim|84|Masculino',
    'Rodrigo Rahman|35|Masculino',
    'Maria|88|Feminino',
    'Helena|24|Feminino',
    'Leonardo|5|Masculino',
    'Laura Maria|29|Feminino',
    'Joaquim|72|Masculino',
    'Helena|24|Feminino',
    'Guilherme|15|Masculino',
    'Manuela|85|Masculino',
    'Leonardo|5|Masculino',
    'Helena|24|Feminino',
    'Laura|29|Feminino',
  ];

  // Baseado na lista acima.

    // 1 - Remover os duplicados
    // 2 - Me mostre a quantidade de pessoas do sexo Masculino e Feminino
    // 3 - Filtrar e deixar a lista somente com pessoas maiores de 18 anos 
    //     e mostre a quantidade de pessoas com mais de 18 anos
    // 4 - Encontre a pessoa mais velha.
  

  try{
    Set<String> peopleSet= Set<String>();
    List<List<String>> peopleList = [];
    int qtyFem = 0;
    int qtyMasc = 0;

    peopleSet = pessoas.toSet();
    
    peopleSet.forEach((pessoa){
      peopleList.add(pessoa.split('|'));
    });

    print('#----------------------#');
    print('Lista original: ');
    print('$pessoas');
    print('#----------------------#\n');

    print('#----------------------#');
    print('Remoção de duplicados: ');
     print('$peopleList');
    print('#----------------------#\n');

    qtyFem = getNumberOfGender(peopleList, 'Feminino');
    qtyMasc = getNumberOfGender(peopleList, 'Masculino');

    print('#----------------------#');
    print('Quantidade feminino: $qtyFem');
    print('#----------------------#\n');

    print('#----------------------#');
    print('Quantidade masculino: $qtyMasc');
    print('#----------------------#\n');

    var peopleOlderThen18Years = getPeopleOlderThen18Years(peopleList);

    print('#----------------------#');
    print('Pessoas com mais de 18 anos: $peopleOlderThen18Years');
    print('#----------------------#\n');

    String oldestPerson = getOldestPerson(peopleList);

    print('#----------------------#');
    print('Pessoa mais velha: $oldestPerson');
    print('#----------------------#\n');

  } on FormatException catch(e){
    print('$e');
  }catch(e){
    print('$e');
  }
 
}

int getNumberOfGender(List pessoas, String genderType){
  int count =0;
  pessoas.forEach((e) => e[2] == genderType ? count++ : null);
  return count;
}

List<List<String>> getPeopleOlderThen18Years(List pessoas) {
  return pessoas.where((p) => int.tryParse(p[1]) >= 18).toList();
}

String getOldestPerson(List pessoas){
  pessoas.sort((a,b) => int.tryParse(b[1]).compareTo(int.tryParse(a[1])));
  return pessoas[0][0];
}

