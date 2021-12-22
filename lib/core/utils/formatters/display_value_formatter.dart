import 'package:intl/intl.dart';

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
}
