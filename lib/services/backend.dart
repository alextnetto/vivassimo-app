import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_app/models/register/user.dart';

class BackendService {
  static BackendService instance = BackendService();
  final String _baseUrl = '10.14.133.167';
  // final String _baseUrl = '172.17.208.1';

  //TODO: Implement error handling

  userExists(String phoneNumber) async {
    Uri url = Uri.http(_baseUrl, '/userExists', {'phoneNumber': phoneNumber});
    try {
      final response = await http.get(url);
      if (response.statusCode != 200) {
        return {'valid': false};
      }
      var data = jsonDecode(response.body);

      return {'valid': true, 'data': data};
    } catch (e) {
      print(e);
      return {'valid': false};
    }
  }

  sendOtp(String phoneNumber) async {
    String body = jsonEncode({'phoneNumber': phoneNumber});
    Uri url = Uri.http(_baseUrl, '/sendOtp');
    const customHeaders = {"content-type": "application/json"};

    try {
      final response = await http.post(url, headers: customHeaders, body: body);
      if (response.statusCode != 200) {
        return {'valid': false};
      }
      return {'valid': true};
    } catch (e) {
      print(e);
      return {'valid': false};
    }
  }

  verifyOtp(String phoneNumber, String token) async {
    Uri url = Uri.http(_baseUrl, '/verifyOtp', {
      'phoneNumber': phoneNumber,
      'token': token,
    });

    try {
      final response = await http.get(url);
      var data = jsonDecode(response.body);

      if (response.statusCode == 500) {
        return {'valid': false, 'message': data['message']};
      } else if (response.statusCode == 400) {
        return {'valid': false, 'message': data['message']};
      } else if (response.statusCode == 200) {
        return {'valid': true, 'message': data['message']};
      }

      return {'valid': true, 'data': data};
    } catch (e) {
      print(e);
      return {'valid': false};
    }
  }

  registerUser(RegisterUser user) async {
    String body = jsonEncode(user.toJson());
    Uri url = Uri.http(_baseUrl, '/users');
    const customHeaders = {"content-type": "application/json"};

    try {
      final response = await http.post(url, headers: customHeaders, body: body);

      print(response.body);

      if (response.statusCode == 201) {
        return {'valid': true};
      } else {
        return {'valid': false};
      }
    } catch (e) {
      print(e);
      return {'valid': false};
    }
  }

  login(String phoneNumber, String password) async {
    String body = jsonEncode({
      'phoneNumber': phoneNumber,
      'password': password,
    });
    Uri url = Uri.http(_baseUrl, '/login');
    const customHeaders = {"content-type": "application/json"};

    try {
      final response = await http.post(url, headers: customHeaders, body: body);
      if (response.statusCode == 200) {
        return {'valid': true};
      } else {
        return {'valid': false};
      }
    } catch (e) {
      print(e);
      return {'valid': false};
    }
  }
}
