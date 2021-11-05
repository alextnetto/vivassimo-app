import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_app/models/register/user.dart';

class BackendService {
  static BackendService instance = BackendService();
  final String _baseUrl = 'localhost';

  //TODO: Implement error handling

  userExists(String phonenumber) async {
    Uri url = Uri.http(_baseUrl, '/userExists', {'phonenumber': phonenumber});
    final response = await http.get(url);
    if (response.statusCode != 200) {
      return {'valid': false};
    }
    var data = jsonDecode(response.body);

    return {'valid': true, 'data': data};
  }

  registerUser(RegisterUser user) async {
    String body = jsonEncode(user.toJson());
    Uri url = Uri.http(_baseUrl, '/users');
    const customHeaders = {"content-type": "application/json"};

    final response = await http.post(url, headers: customHeaders, body: body);
    if (response.statusCode == 201) {
      return {'valid': true};
    } else {
      return {'valid': false};
    }
  }
}
