import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';
import 'package:denizustu/src/api/api_service.dart';
import 'package:denizustu/src/model/post.dart';

final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

class KontrolWidget extends StatefulWidget {
  Sensor sensor;
  KontrolWidget({Key key}) : super(key: key);
  @override
  _KontrolWidgetState createState() => _KontrolWidgetState();
}

class _KontrolWidgetState extends State<KontrolWidget> {
  final _formKey = GlobalKey<FormState>();

  bool _lights = false;
  bool _uMotor = true;
  bool _aMotor = true;

  bool _isLoading = false;
  ApiService _apiService = ApiService();
  bool _isSuccess = false;
  bool _isFailed = false;
  TextEditingController _controllerName = TextEditingController();
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerAge = TextEditingController();

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
                        // Validate will return true if the form is valid, or false if
                        // the form is invalid.
                        if (_formKey.currentState.validate()) {
                          // Process data.
                        }
                      },
                      child:
                          const Text('Kaydet', style: TextStyle(fontSize: 20)),
                    ))
                  ],
                )),
            _buildTextFieldName(),
            _buildTextFieldEmail(),
            _buildTextFieldAge(),
            // _buildButton(),
          ],
        )
      ]),
    );
  }

  Widget _buildTextFieldName() {
    return TextField(
      controller: _controllerName,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: "Full name",
      ),
    );
  }

  Widget _buildTextFieldEmail() {
    return TextField(
      controller: _controllerEmail,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: "Email",
      ),
    );
  }

  Widget _buildTextFieldAge() {
    return TextField(
      controller: _controllerAge,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: "Age",
      ),
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
          String name = _controllerName.text.toString();
          String email = _controllerEmail.text.toString();
          int age = int.parse(_controllerAge.text.toString());
          Sensor sensor = Sensor(motorDevri: age, basinc: age, derinlik: age, sicaklik: age);
          /* if (widget.post == null) {
            _apiService.createProfile(post).then((isSuccess) {
              setState(() => _isLoading = false);
              if (isSuccess) {
                print("Gönderdi");
                _scaffoldState.currentState.showSnackBar(SnackBar(
                  content: Text("Gönderildi, başarılı"),
                ));
                _isSuccess = true;
              } else {
                _scaffoldState.currentState.showSnackBar(SnackBar(
                  content: Text("Olmadı, niye olmadı?"),
                ));
              }
            });
          } */
        },
        color: Colors.orange[600],
      ),
    );
  }
}
