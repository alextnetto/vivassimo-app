import 'dart:convert';

class CepResponseModel {
  bool success;
  String cep;
  String logradouro;
  String complemento;
  String bairro;
  String localidade;
  String uf;

  CepResponseModel({
    required this.success,
    this.cep = '',
    this.logradouro = '',
    this.complemento = '',
    this.bairro = '',
    this.localidade = '',
    this.uf = '',
  });

  Map<String, dynamic> toMap() {
    return {
      'success': success,
      'cep': cep,
      'logradouro': logradouro,
      'complemento': complemento,
      'bairro': bairro,
      'localidade': localidade,
      'uf': uf,
    };
  }

  factory CepResponseModel.fromMap(Map<String, dynamic> map) {
    return CepResponseModel(
      success: map['success'] ?? false,
      cep: map['cep'] ?? '',
      logradouro: map['logradouro'] ?? '',
      complemento: map['complemento'] ?? '',
      bairro: map['bairro'] ?? '',
      localidade: map['localidade'] ?? '',
      uf: map['uf'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CepResponseModel.fromJson(String source) =>
      CepResponseModel.fromMap(json.decode(source));
}
