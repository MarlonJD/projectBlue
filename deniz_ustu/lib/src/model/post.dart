import 'dart:convert';

import 'dart:ffi';


// Switch
class Motor{
  bool d1;
  bool d2;
  bool motor1;
  bool motor2;

  Motor({this.d1, this.d2, this.motor1, this.motor2});

  Map<dynamic, dynamic> toJson() {
    return {"d1": d1, "d2": d2, "m1": motor1, "m2": motor2};
  }

  @override
  String toString() {
    return 'Switch{d1: $d1, d2: $d2, m1: $motor1, m2: $motor2}';
  }
}

String switchToJson(Motor data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}


// Sensor class
class Sensor{
  String denizSeviyesi;
  String basinc;
  String derinlik ;
  String sicaklik;

  Sensor({this.denizSeviyesi, this.basinc, this.derinlik, this.sicaklik});

  factory Sensor.fromJson(Map<String, dynamic> map) {
    return Sensor(
      denizSeviyesi: map["deniz_seviyesi"],
      basinc: map["basinc"],
      derinlik: map["derinlik"],
      sicaklik: map["sicaklik"]
    );
  }
}

sensorFromJson(String jsonData) {
  final data = json.decode(jsonData);
  Sensor sensor = new Sensor.fromJson(data);
  return sensor;
}