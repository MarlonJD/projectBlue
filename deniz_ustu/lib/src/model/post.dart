import 'dart:convert';


// Switch
class Switches{
  bool lights;
  bool uMotor;
  bool aMotor;

  Switches({this.lights, this.uMotor, this.aMotor});

  Map<dynamic, dynamic> toJson() {
    return {"lights": lights, "uMotor": uMotor, "aMotor": aMotor};
  }

  @override
  String toString() {
    return 'Switch{lights: $lights, uMotor: $uMotor, aMotor: $aMotor}';
  }
}

String switchToJson(Switches data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}


// Sensor class
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
}

sensorFromJson(String jsonData) {
  final data = json.decode(jsonData);
  Sensor sensor = new Sensor.fromJson(data);
  return sensor;
}

