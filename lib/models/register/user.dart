class RegisterUser {
  String? name, email, phonenumber, password, cpf, gender, birthday;
  static RegisterUser instance = RegisterUser();

  Map<String, String?> toJson() => {
        'name': name,
        'email': email,
        'phonenumber': phonenumber,
        'password': password,
        'cpf': cpf,
        'gender': gender,
        'birthday': birthday
      };
}
