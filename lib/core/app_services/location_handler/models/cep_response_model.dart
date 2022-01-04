import 'dart:convert';

class CepResponseModel {
  bool success;
  String zipCode;
  String street;
  String complement;
  String neighborhood;
  String city;
  String state;

  CepResponseModel({
    required this.success,
    this.zipCode = '',
    this.street = '',
    this.complement = '',
    this.neighborhood = '',
    this.city = '',
    this.state = '',
  });

  Map<String, dynamic> toMap() {
    return {
      'success': success,
      'zipCode': zipCode,
      'street': street,
      'complement': complement,
      'neighborhood': neighborhood,
      'city': city,
      'state': state,
    };
  }

  factory CepResponseModel.fromMap(Map<String, dynamic> map) {
    return CepResponseModel(
      success: map['success'] ?? true,
      zipCode: map['cep'] ?? '',
      street: map['logradouro'] ?? '',
      complement: map['complemento'] ?? '',
      neighborhood: map['bairro'] ?? '',
      city: map['localidade'] ?? '',
      state: map['uf'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CepResponseModel.fromJson(String source) => CepResponseModel.fromMap(json.decode(source));
}
