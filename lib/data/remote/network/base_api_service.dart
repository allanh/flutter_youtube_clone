abstract class BaseApiService {
  final String baseUrl = "https://run.mocky.io/v3/";

  Future<dynamic> getResponse(String url);
  Future<dynamic> postResponse(String url, Map<String, String> jsonBody);
}
