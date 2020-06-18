import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';
import 'package:denizustu/src/api/api_service.dart';
import 'package:denizustu/src/model/post.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

class KontrolWidget extends StatefulWidget {
  Sensor sensor;
  Motor switches;

  /* KontrolWidget({Key key}) : super(key: key); */
  KontrolWidget({this.switches});

  @override
  _KontrolWidgetState createState() => _KontrolWidgetState();
}

class _KontrolWidgetState extends State<KontrolWidget> {
  String _baseURl;
  String _val;

  @override
  void initState() {
    super.initState();
    _loadBaseUrl();
  }

  //Loading counter value on start
  _loadBaseUrl() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _baseURl = prefs.getString('baseurl');
      _controllerBaseUrl.text = _baseURl;
    });
    print(_baseURl);
  }

  Future<bool> setBaseUrl(String value) async {
	  final SharedPreferences prefs = await SharedPreferences.getInstance();
	  return prefs.setString('baseurl', value);
  }

  final _formKey = GlobalKey<FormState>();

  bool _d1 = false;
  bool _d2 = false;
  bool _motor1 = false;
  bool _motor2 = false;

  bool _isLoading = false;
  ApiService _apiService = ApiService();
  bool _isSuccess = false;
  bool _isFailed = false;
  TextEditingController _controllerBaseUrl = TextEditingController();
  // obtain shared preferences


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState,
      body: ListView(padding: EdgeInsets.all(5), children: [
        Column(
          children: [
            GFCard(
              color: Color(0xFF4A6A8A),
              padding: EdgeInsets.zero,
              title: GFListTile(
                margin: EdgeInsets.zero,
                title: Text('Motor Yönü'),
              ),
              content: Column(
                children: [
              SwitchListTile(
                title: const Text('Üst Motor Yönü'),
                value: _d1,
                onChanged: (bool value) {
                  setState(() {
                    _d1 = value;
                    Motor switches = Motor(d1: _d1, d2: _d2, motor1: _motor1, motor2: _motor2);
                    _apiService.sendMotor(switches).then((isSuccess) {
                          setState(() => _isLoading = false);
                          if (isSuccess) {
                            print("Gönderdi");
                            _scaffoldState.currentState.showSnackBar(SnackBar(
                              content: Text("Gönderildi, başarılı"),
                            ));
                          } else {
                            print("Başarısız tıpkı senin gibi...");
                            _scaffoldState.currentState.showSnackBar(SnackBar(
                              content: Text("Submit data failed"),
                            ));
                          }
                        });
                  });
                },
                secondary: const Icon(Icons.lightbulb_outline),
              ),
              SwitchListTile(
                title: const Text('Alt Motor Yönü'),
                value: _d2,
                onChanged: (bool value) {
                  setState(() {
                    _d2 = value;
                    Motor switches = Motor(d1: _d1, d2: _d2, motor1: _motor1, motor2: _motor2);
                    _apiService.sendMotor(switches).then((isSuccess) {
                          setState(() => _isLoading = false);
                          if (isSuccess) {
                            print("Gönderdi");
                            _scaffoldState.currentState.showSnackBar(SnackBar(
                              content: Text("Gönderildi, başarılı"),
                            ));
                          } else {
                            print("Başarısız tıpkı senin gibi...");
                            _scaffoldState.currentState.showSnackBar(SnackBar(
                              content: Text("Submit data failed"),
                            ));
                          }
                        });
                  });
                },
                secondary: const Icon(Icons.lightbulb_outline),
              ),
              ])
            ),
            GFCard(
                color: Color(0xFF4A6A8A),
                padding: EdgeInsets.zero,
                title: GFListTile(
                  margin: EdgeInsets.zero,
                  title: Text('Motorlar'),
                ),
                content: Column(children: [
                  SwitchListTile(
                    title: const Text('Üst Motor'),
                    value: _motor1,
                    onChanged: (bool value) {
                      setState(() {
                        _motor1 = value;
                        Motor switches = Motor(d1: _d1, d2: _d2, motor1: _motor1, motor2: _motor2);
                        _apiService.sendMotor(switches).then((isSuccess) {
                          setState(() => _isLoading = false);
                          if (isSuccess) {
                            print("Gönderdi");
                            _scaffoldState.currentState.showSnackBar(SnackBar(
                              content: Text("Gönderildi, başarılı"),
                            ));
                          } else {
                            print("Başarısız tıpkı senin gibi...");
                            _scaffoldState.currentState.showSnackBar(SnackBar(
                              content: Text("Submit data failed"),
                            ));
                          }
                        });
                      });
                    },
                    secondary: const Icon(Icons.flash_on),
                  ),
                  SwitchListTile(
                    title: const Text('Alt Motor'),
                    value: _motor2,
                    onChanged: (bool value) {
                      setState(() {
                        _motor2 = value;
                        Motor switches = Motor(d1: _d1, d2: _d2, motor1: _motor1, motor2: _motor2);
                    _apiService.sendMotor(switches).then((isSuccess) {
                          setState(() => _isLoading = false);
                          if (isSuccess) {
                            print("Gönderdi");
                            _scaffoldState.currentState.showSnackBar(SnackBar(
                              content: Text("Gönderildi, başarılı"),
                            ));
                          } else {
                            _scaffoldState.currentState.showSnackBar(SnackBar(
                              content: Text("Başarısız :("),
                            ));
                          }
                        });
                      });
                    },
                    secondary: const Icon(Icons.flash_on),
                  ),
                ])),
            GFCard(
                color: Color(0xFF4A6A8A),
                padding: EdgeInsets.zero,
                title: GFListTile(
                  margin: EdgeInsets.zero,
                  title: Text('Çevre'),
                ),
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    ConstrainedBox(
                        constraints: BoxConstraints.tight(Size(200, 50)),
                        child: TextFormField(
                          controller: _controllerBaseUrl,
                          decoration: const InputDecoration(
                            hintText: 'Server IP',
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Server IP giriniz.';
                            }
                            return null;
                          },
                        )),
                    Flexible(
                        child: RaisedButton(
                        color: Colors.blueGrey,
                        splashColor: Color(0xFF64ffda),
                        onPressed: () {
                          setState(() {
                            setBaseUrl(_controllerBaseUrl.text);
                          });
                          _scaffoldState.currentState.showSnackBar(SnackBar(
                              content: Text("Kaydedildi"),
                          ));
                        },
                      child:
                          const Text('Kaydet', style: TextStyle(fontSize: 20)),
                    ))
                  ],
                )),
            // _buildButton(),
          ],
        )
      ]),
    );
  }


  Widget _buildButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: RaisedButton(
        child: Text(
          "Submit",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        onPressed: () {
          setState(() => _isLoading = true);
          
        },
        color: Colors.orange[600],
      ),
    );
  }
}
