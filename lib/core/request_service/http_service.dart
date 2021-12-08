import 'package:my_app/core/request_service/interface/i_request_service.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/features/login/domain/errors/login_errors.dart';

class HttpService implements IRequestService {
  var customHeaders = {"content-type": "application/json"};
  // var baseUrl = '10.21.100.132';
  var baseUrl = '172.17.208.1';

  @override
  Future<dynamic> post({required String endpoint, required String body}) async {
    var url = Uri.http(baseUrl, endpoint);

    final response = await http
        .post(url, headers: customHeaders, body: body)
        .timeout(Duration(seconds: 10), onTimeout: () {
      throw LoginTimeoutError(message: 'Timeout');
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
