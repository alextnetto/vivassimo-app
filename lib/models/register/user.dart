class RegisterUser {
  String? name,
      email,
      phoneNumber,
      password,
      cpf,
      gender,
      birthday,
      cep,
      estado,
      cidade,
      bairro,
      logradouro,
      numero,
      complemento;
  static RegisterUser instance = RegisterUser();

  toJson() {
    return {
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'password': password,
      'cpf': cpf,
      'gender': gender,
      'birthday': birthday,
      'estado': estado,
      'cep': cep,
      'cidade': cidade,
      'bairro': bairro,
      'logradouro': logradouro,
      'numero': numero,
      'complemento': complemento,
    };
  }
}
