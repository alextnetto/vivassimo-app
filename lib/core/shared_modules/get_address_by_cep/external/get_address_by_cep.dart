import 'dart:convert';

import 'package:http/http.dart' as http;

Future<Map> cepToAddress(cep) async {
  var url = 'https://viacep.com.br/ws/$cep/json/';
  var response = await http.get(Uri.parse(url));

  print(response);

  if (response.statusCode != 200) {
    return {'valid': false};
  }

  var data = jsonDecode(response.body);

  if (data['erro'] == true) {
    return {'valid': false};
  }
  return {'valid': true, 'data': data};
}
