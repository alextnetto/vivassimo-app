import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class AppMasks {
  static MaskTextInputFormatter cep = MaskTextInputFormatter(
    mask: '#####-###',
    filter: {
      "#": RegExp(r'[0-9]'),
    },
  );

  static MaskTextInputFormatter phone = MaskTextInputFormatter(
    mask: '+55 (##) #####-####',
    filter: {
      "#": RegExp(r'[0-9]'),
    },
  );

  static MaskTextInputFormatter cpf = MaskTextInputFormatter(
    mask: '###.###.###-##',
    filter: {
      "#": RegExp(r'[0-9]'),
    },
  );

  static MaskTextInputFormatter dataNascimento = MaskTextInputFormatter(
    mask: '##/##/####',
    filter: {
      "#": RegExp(r'[0-9]'),
    },
  );
}
