import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class AppMasks {
  static MaskTextInputFormatter cep = MaskTextInputFormatter(
    mask: '#####-###',
    filter: {
      "#": RegExp(r'[0-9]'),
    },
    //initialText: RegisterUser.instance.cep,
  );
}
