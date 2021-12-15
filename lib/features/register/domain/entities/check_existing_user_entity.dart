import 'dart:convert';

import 'package:equatable/equatable.dart';

class RegisterUserEntity extends Equatable {
  final String? name;
  final String? email;
  final String? phoneNumber;
  final String? password;
  final String? genero;
  final String? cpf;
  final String? dataNascimento;
  final String? cep;
  final String? bairro;
  final String? rua;
  final String? numero;
  final String? complemento;

  const RegisterUserEntity({
    this.name,
    this.email,
    this.password,
    this.genero,
    this.cpf,
    this.dataNascimento,
    this.cep,
    this.bairro,
    this.rua,
    this.numero,
    this.complemento,
    this.phoneNumber,
  });

  @override
  // TODO: implement props
  List<Object?> get props {
    return [
      name,
      email,
      phoneNumber,
      password,
      genero,
      cpf,
      dataNascimento,
      cep,
      bairro,
      rua,
      numero,
      complemento,
    ];
  }

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

  factory RegisterUserEntity.fromMap(Map<String, dynamic> map) {
    return RegisterUserEntity(
      name: map['name'],
      email: map['email'],
      phoneNumber: map['phoneNumber'],
      password: map['password'],
      genero: map['genero'],
      cpf: map['cpf'],
      dataNascimento: map['dataNascimento'],
      cep: map['cep'],
      bairro: map['bairro'],
      rua: map['rua'],
      numero: map['numero'],
      complemento: map['complemento'],
    );
  }

  String toJson() => json.encode(toMap());

  factory RegisterUserEntity.fromJson(String source) =>
      RegisterUserEntity.fromMap(json.decode(source));
}
