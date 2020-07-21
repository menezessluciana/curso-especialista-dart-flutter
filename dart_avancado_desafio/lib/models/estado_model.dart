import 'dart:convert';

class EstadoModel {
  int id;
  String sigla;
  String nome;

  EstadoModel({
    this.id,
    this.sigla,
    this.nome,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'sigla': sigla,
      'nome': nome,
    };
  }

  static EstadoModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return EstadoModel(
      id: map['id'],
      sigla: map['sigla'],
      nome: map['nome'],
    );
  }

  String toJson() => json.encode(toMap());

  static EstadoModel fromJson(String source) => fromMap(json.decode(source));
}
