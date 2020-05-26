import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';
import 'package:denizustu/src/api/api_service.dart';
import 'package:denizustu/src/model/post.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

class KontrolWidget extends StatefulWidget {
  Sensor sensor;
  Switches switches;

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

  bool _lights = false;
  bool _uMotor = false;
  bool _aMotor = false;

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
                title: Text('Çevre'),
              ),
              content: SwitchListTile(
                title: const Text('Aydınlatma'),
                value: _lights,
                onChanged: (bool value) {
                  setState(() {
                    _lights = value;
                    Switches switches = Switches(lights: _lights, uMotor: _uMotor, aMotor: _aMotor);
                    _apiService.sendSwitch(switches).then((isSuccess) {
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
                    value: _uMotor,
                    onChanged: (bool value) {
                      setState(() {
                        _uMotor = value;
                        Switches switches = Switches(lights: _lights, uMotor: _uMotor, aMotor: _aMotor);
                        _apiService.sendSwitch(switches).then((isSuccess) {
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
                    value: _aMotor,
                    onChanged: (bool value) {
                      setState(() {
                        _aMotor = value;
                        Switches switches = Switches(lights: _lights, uMotor: _uMotor, aMotor: _aMotor);
                    _apiService.sendSwitch(switches).then((isSuccess) {
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
