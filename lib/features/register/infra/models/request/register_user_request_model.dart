import 'dart:convert';

class RegisterUserRequestModel {
  String name;
  String email;
  String phoneNumber;
  String password;
  String genero;
  String cpf;
  String dataNascimento;
  String cep;
  String bairro;
  String rua;
  String numero;
  String complemento;

  RegisterUserRequestModel({
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.password,
    required this.genero,
    required this.cpf,
    required this.dataNascimento,
    required this.cep,
    required this.bairro,
    required this.rua,
    required this.numero,
    required this.complemento,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'password': password,
      'genero': genero,
      'cpf': cpf,
      'dataNascimento': dataNascimento,
      'cep': cep,
      'bairro': bairro,
      'rua': rua,
      'numero': numero,
      'complemento': complemento,
    };
  }

  factory RegisterUserRequestModel.fromMap(Map<String, dynamic> map) {
    return RegisterUserRequestModel(
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      password: map['password'] ?? '',
      genero: map['genero'] ?? '',
      cpf: map['cpf'] ?? '',
      dataNascimento: map['dataNascimento'] ?? '',
      cep: map['cep'] ?? '',
      bairro: map['bairro'] ?? '',
      rua: map['rua'] ?? '',
      numero: map['numero'] ?? '',
      complemento: map['complemento'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory RegisterUserRequestModel.fromJson(String source) =>
      RegisterUserRequestModel.fromMap(json.decode(source));
}
