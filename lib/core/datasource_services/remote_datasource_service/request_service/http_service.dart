import 'package:http/http.dart' as http;
import 'package:my_app/core/contracts/i_request_service.dart';
import 'package:my_app/core/errors/request_timeout.dart';

class HttpService implements IRequestService {
  var customHeaders = {"content-type": "application/json"};
  // var baseUrl = '10.21.100.132';
  //var baseUrl = '172.17.208.1';
  var baseUrl = 'localhost';

  @override
  Future<dynamic> post({required String endpoint, required String body}) async {
    var url = Uri.http(baseUrl, endpoint);

    final response = await http
        .post(url, headers: customHeaders, body: body)
        .timeout(Duration(seconds: 10), onTimeout: () {
      throw RequestTimeoutError(message: 'Timeout');
    });

    return response;
  }

  @override
  delete() {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<dynamic> getData(
      {required String endpoint, Map<String, dynamic>? queryParams}) async {
    var url = Uri.http(baseUrl, endpoint, queryParams);

    final response =
        await http.get(url).timeout(Duration(seconds: 10), onTimeout: () {
      throw RequestTimeoutError(message: 'Timeout');
    });

    print(response.body);
    return response;
  }

  @override
  put() {
    // TODO: implement put
    throw UnimplementedError();
  }
}
