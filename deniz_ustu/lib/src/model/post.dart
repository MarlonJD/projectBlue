import 'dart:convert';

class Sensor{
  int motorDevri;
  int basinc;
  int derinlik ;
  int sicaklik;

  Sensor({this.motorDevri, this.basinc, this.derinlik, this.sicaklik});

  factory Sensor.fromJson(Map<String, dynamic> map) {
    return Sensor(
      motorDevri: map["motor_devri"],
      basinc: map["basinc"],
      derinlik: map["derinlik"],
      sicaklik: map["sicaklik"]
    );
  }

/*   Map<dynamic, dynamic> toJson() {
    return {"motor_devri": motor_devri, "basinc": body, "userId": userId};
  } */

/*   @override
  String toString() {
    return 'Post{userId: $userId, id: $id}';
  } */
}

 sensorFromJson(String jsonData) {
  final data = json.decode(jsonData);
  Sensor sensor = new Sensor.fromJson(data);
  return sensor;
}

/* String postToJson(Post data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
} */