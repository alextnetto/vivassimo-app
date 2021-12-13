abstract class IRequestService {
  Future<dynamic> post({required String endpoint, required String body});
  delete();
  Future<dynamic> getData(
      {required String endpoint, Map<String, dynamic>? queryParams});
  put();
}
