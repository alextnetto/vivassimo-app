import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:my_app/models/register/user.dart';

class AppMasks {
  static MaskTextInputFormatter cep = MaskTextInputFormatter(
    mask: '#####-###',
    filter: {
      "#": RegExp(r'[0-9]'),
    },
    initialText: RegisterUser.instance.cep,
  );
}
