abstract class IRequestService {
  Future<dynamic> post({required String endpoint, required String body});
  delete();
  getData();
  put();
}
