import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';
import 'package:control_pad/control_pad.dart';
import 'package:video_player/video_player.dart';

class KontrolWidget extends StatefulWidget {
  KontrolWidget({Key key}) : super(key: key);
  @override
  _KontrolWidgetState createState() => _KontrolWidgetState();
}

class _KontrolWidgetState extends State<KontrolWidget> {
  final _formKey = GlobalKey<FormState>();

  bool _lights = false;
  bool _uMotor = true;
  bool _aMotor = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      child: const Text('Kaydet', style: TextStyle(fontSize: 20)),

                    ))
                  ],
                ))
          ],
        )
      ]),
    );
  }
}
