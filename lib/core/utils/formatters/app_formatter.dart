import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class AppFormatter {
  static String displayValueFormatter(num valor) {
    final formatter = NumberFormat("#,##0.00", "pt_BR");
    String newText = "R\$ " + formatter.format(valor);
    return newText;
  }

  static double convertStringToDouble(String replaceAll) {
    String valor = replaceAll
        .replaceAll('.', '')
        .replaceAll(',', '.')
        // .replaceAll(codigoMoeda, '')
        .trim();
    var myDouble = double.parse(valor);
    assert(myDouble is double);
    return myDouble;
  }

  static var creditCardInputFormatter = MaskTextInputFormatter(
    mask: "#### #### #### ####",
    filter: {
      "#": RegExp(r'[0-9]'),
    },
  );

  static var dateInputFormatter = MaskTextInputFormatter(
    mask: "##/####",
    filter: {
      "#": RegExp(r'[0-9]'),
    },
  );

  static var passwordFormatter = MaskTextInputFormatter(
    mask: "######",
    filter: {
      "#": RegExp(r'[0-9]'),
    },
  );

    static var cvvFormatter = MaskTextInputFormatter(
    mask: "####",
    filter: {
      "#": RegExp(r'[0-9]'),
    },
  );
}
