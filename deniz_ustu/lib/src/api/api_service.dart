import 'package:denizustu/src/model/post.dart';
import 'package:http/http.dart' show Client;

class ApiService {
  final String baseUrl = "http://192.168.1.40:8000/api";
  Client client = Client();

  Future<Sensor> getSensors() async {
    final response = await client.get("$baseUrl/sensor/1/");
    if (response.statusCode == 200) {
      return sensorFromJson(response.body);
    } else {
      return null;
    }
  }

/*   Future<bool> createProfile(Sensor data) async {
    final response = await client.post(
      "$baseUrl/posts",
      headers: {"content-type": "application/json; charset=UTF-8"},
      body: postToJson(data),
    );
    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  } */
}
