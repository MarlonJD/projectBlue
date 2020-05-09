import 'package:denizustu/src/model/post.dart';
import 'package:http/http.dart' show Client;

class ApiService {
  final String baseUrl = "https://jsonplaceholder.typicode.com";
  Client client = Client();

  Future<Post> getPosts() async {
    final response = await client.get("$baseUrl/posts/2/");
    if (response.statusCode == 200) {
      return postFromJson(response.body);
    } else {
      return null;
    }
  }
}
