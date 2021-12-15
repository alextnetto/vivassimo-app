import 'package:http/http.dart' as http;
import 'package:my_app/core/contracts/i_request_service.dart';
import 'package:my_app/features/login/domain/errors/login_errors.dart';

class HttpService implements IRequestService {
  // var baseUrl = '10.21.100.132';

  @override
  Future<dynamic> post({required String endpoint, required String body}) async {
    var baseUrl = 'localhost';
    var customHeaders = {"content-type": "application/json"};

    var url = Uri.http(baseUrl, endpoint);

    final response = await http
        .post(url, headers: customHeaders, body: body)
        .timeout(Duration(seconds: 50), onTimeout: () {
      throw LoginTimeoutError();
    });

    return response;
  }

  @override
  delete() {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  getData() {
    // TODO: implement getData
    throw UnimplementedError();
  }

  @override
  put() {
    // TODO: implement put
    throw UnimplementedError();
  }
}
