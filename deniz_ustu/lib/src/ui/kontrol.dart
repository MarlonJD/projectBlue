import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';
import 'package:control_pad/control_pad.dart';
import 'package:video_player/video_player.dart';

class KontrolWidget extends StatefulWidget {
  @override
  _KontrolWidgetState createState() => _KontrolWidgetState();
}

class _KontrolWidgetState extends State<KontrolWidget> {
  bool _lights = false;
  bool _uMotor = false;
  bool _aMotor = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
          padding: EdgeInsets.all(5),
          children: [
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
            ],
          )]),
    );
  }
}
