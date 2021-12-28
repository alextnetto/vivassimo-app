import 'package:cpf_cnpj_validator/cpf_validator.dart';
import 'package:email_validator/email_validator.dart';
import 'package:intl/intl.dart';

extension StringExtension on String {
  bool get isStrongPassword {
    return RegExp(r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$")
        .hasMatch(this);
  }

  bool get isValidPhoneNumber {
    return RegExp(r"^[0-9]{11}$").hasMatch(this);
  }

  bool get isValidEmail {
    return EmailValidator.validate(this);
  }

  bool get isValidCpf {
    return CPFValidator.isValid(this);
  }

  bool get isValidBirthday {
    try {
      String datePattern = "dd/MM/yyyy";
      DateTime birthDate = DateFormat(datePattern).parse(this);
      DateTime today = DateTime.now();

      if (birthDate.isAfter(today) || birthDate.year < 1900) {
        return false;
      }
      return true;
    } on FormatException {
      return false;
    }
  }
}
