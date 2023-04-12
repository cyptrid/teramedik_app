import 'package:get/get.dart';

class HostProvider extends GetConnect {
  String url = "https://cyptrid.my.id/api";
  Future<Response> userLogin(String username, String password) =>
      post("$url/login", {
        'username': username,
        'password': password,
      }, headers: {
        'Accept': 'aplication/json'
      });

  Future<List<dynamic>> getData() async {
    final response = await get('$url/lists', headers: {
      "Accept": "application/json",
      "Authorization": "Bearer 1|CVVnmcAfWTEljneG95XsZlk5ndtziO8YlNX3QakJ",
    });
    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return response.body;
    }
  }

  Future<Response> getDataById(int id) => get('$url/lists/$id', headers: {
        "Accept": "application/json",
        "Authorization": "Bearer 1|CVVnmcAfWTEljneG95XsZlk5ndtziO8YlNX3QakJ",
      });
}
