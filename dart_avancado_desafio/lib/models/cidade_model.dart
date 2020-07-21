import 'dart:convert';

class CidadeModel {
  int id;
  String nome;

  CidadeModel({
    this.id,
    this.nome,
  });
  

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
    };
  }

  static CidadeModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return CidadeModel(
      id: map['id'],
      nome: map['nome'],
    );
  }

  String toJson() => json.encode(toMap());

  static CidadeModel fromJson(String source) => fromMap(json.decode(source));
}
