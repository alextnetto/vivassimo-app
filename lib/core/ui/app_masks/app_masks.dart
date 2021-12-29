import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class AppMasks {
  static MaskTextInputFormatter cepFormatter = MaskTextInputFormatter(
    mask: '#####-###',
    filter: {
      "#": RegExp(r'[0-9]'),
    },
  );

  static MaskTextInputFormatter phoneFormatter = MaskTextInputFormatter(
    mask: '+55 (##) #####-####',
    filter: {
      "#": RegExp(r'[0-9]'),
    },
  );

  static MaskTextInputFormatter cpfFormatter = MaskTextInputFormatter(
    mask: '###.###.###-##',
    filter: {
      "#": RegExp(r'[0-9]'),
    },
  );

  static MaskTextInputFormatter birthDateFormatter = MaskTextInputFormatter(
    mask: '##/##/####',
    filter: {
      "#": RegExp(r'[0-9]'),
    },
  );
}
