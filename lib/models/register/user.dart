class RegisterUser {
  String? name,
      email,
      phonenumber,
      password,
      cpf,
      gender,
      birthday,
      estado,
      cidade,
      bairro,
      cep,
      numero;
  static RegisterUser instance = RegisterUser();

  toJson() {
    return {
      'name': name,
      'email': email,
      'phonenumber': phonenumber,
      'password': password,
      'cpf': cpf,
      'gender': gender,
      'birthday': birthday,
      'estado': estado,
      'cidade': cidade,
      'bairro': bairro,
      'cep': cep,
      'numero': numero,
    };
  }
}
