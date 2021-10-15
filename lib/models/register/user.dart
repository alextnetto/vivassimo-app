class RegisterUser {
  String? name, email, phonenumber, password, cpf, genre, birthday;
  static RegisterUser instance = RegisterUser();

  Map<String, String?> toJson() => {
        'name': name,
        'email': email,
        'phonenumber': phonenumber,
        'password': password,
        'cpf': cpf,
        'genre': genre,
        'birthday': birthday
      };
}
