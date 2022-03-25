import 'package:http/http.dart' as http;
import 'package:portofolio_flutter/game_gallery/data/exceptions/exceptions.dart';

abstract class RequestMethod {
  Future<http.Response> call(
      {required String url,
      required RequestType requestType,
      Map<String, dynamic>? body,
      Map<String, String>? headers});
}

class RequestService implements RequestMethod {
  static const API_KEY = "d3c7d3b0bf514e0f836c1b61dea95161";
  static const SUCCESS_REQUEST_OK = 200;
  final Map<String, String> _jsonHeaders = {'content-type': 'application/json'};

  final http.Client client;

  RequestService({required this.client});

  @override
  Future<http.Response> call(
      {required String url,
      required RequestType requestType,
      Map<String, dynamic>? body,
      Map<String, String>? headers}) async {
    http.Response response;
    headers ??= _jsonHeaders;
    try {
      Uri uri = Uri.parse(url +"?key="+API_KEY);
      switch (requestType) {
        case RequestType.post:
          response = await client.post(uri, body: body, headers: headers);
          break;
        case RequestType.get:
          response = await client.get(uri, headers: headers);
          break;
      }

      if (response.statusCode != SUCCESS_REQUEST_OK) {
        throw HTTPRequestException();
      }

      return response;

    } catch (exception) {
      if (exception is HTTPRequestException) {
        rethrow;
      }
      throw OTHERRequestException();
    }
  }
}

enum RequestType {
  post,
  get,
}
