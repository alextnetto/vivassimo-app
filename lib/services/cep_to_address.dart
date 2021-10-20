import 'dart:convert';

import 'package:http/http.dart' as http;

Future<Map> cepToAddress(cep) async {
  var url = 'https://viacep.com.br/ws/$cep/json/';
  var response = await http.get(Uri.parse(url));
  return jsonDecode(response.body);
}
