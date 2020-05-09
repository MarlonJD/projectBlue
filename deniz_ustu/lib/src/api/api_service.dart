import 'package:denizustu/src/model/post.dart';
import 'package:http/http.dart' show Client;

class ApiService {
  final String baseUrl = "https://randomapi.com/api";
  Client client = Client();

  Future<Post> getPosts() async {
    final response = await client.get("$baseUrl/be2pe9p5?key=XAQK-0GJ8-V1FF-0BLS");
    if (response.statusCode == 200) {
      return postFromJson(response.body);
    } else {
      return null;
    }
  }
}
