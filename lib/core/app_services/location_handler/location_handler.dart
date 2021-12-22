import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:geocoding/geocoding.dart';

import 'models/cep_response_model.dart';

class LocationHandler {
  static Future<CepResponseModel> getAddressByCep(cep) async {
    var url = 'https://viacep.com.br/ws/$cep/json/';
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      if (data['erro'] == true) {
        return CepResponseModel(success: false);
      } else {
        return CepResponseModel.fromMap(data);
      }
    } else {
      return CepResponseModel(success: false);
    }
  }

  static Future<Placemark> getAddressByCoordinates(lat, lon) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(lat, lon);
    return placemarks.first;
  }
}
