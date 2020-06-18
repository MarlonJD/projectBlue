import 'package:denizustu/src/model/post.dart';
import 'package:http/http.dart' show Client;

class ApiService {
  final String baseUrl = "http://192.168.1.55:8001/api";
  Client client = Client();

  Future<Sensor> getSensors() async {
    final response = await client.get("$baseUrl/sensor/2/");
    if (response.statusCode == 200) {
      return sensorFromJson(response.body);
    } else {
      return null;
    }
  }

  Future<bool> sendMotor(Motor data) async {
    final response = await client.patch(
      "$baseUrl/motor/2/",
      headers: {"content-type": "application/json; charset=UTF-8"},
      body: switchToJson(data),
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

}
