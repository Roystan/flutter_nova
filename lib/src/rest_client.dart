import 'dart:convert';
import 'dart:io';
import '../misc.dart';

class RestClient {
  Future<Map<String, dynamic>> callFunction(
      String func, String version, String params, String verb) async {
    String urlUsed =
        Misc.baseUrl + "/v" + version + "/" + func + "&method=" + verb;

    var result = await sendRequest(urlUsed, params, verb);
    return result;
  }

  Future<Map<String, dynamic>> sendRequest(
      String urlUsed, String params, String verb) async {
    HttpClient httpClient = new HttpClient();
    HttpClientRequest request =
        await httpClient.getUrl(Uri.parse(urlUsed + params));
    request.headers.set('Content-type', 'application/json');
    request.headers.set('Authorization',
        'Basic NWU0NzJhYjQtMWM2MC00ZmQyLTkwOWEtNDBjZjU4MjkxYmY2OjM5ZDcxYjk4LTgzZTYtNGY1NC1hYjYzLWEzNjA5MzAyZmExNg==');
    // request.add(utf8.encode(json.encode(rawBody)));
    HttpClientResponse response = await request.close();
    String reply = await response.transform(utf8.decoder).join();
    var jsonReply = json.decode(reply);
    httpClient.close();

    return jsonReply;
  }
}
