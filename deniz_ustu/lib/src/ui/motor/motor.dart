import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';


class MotorWidget extends StatelessWidget {
  //final Color color;
  //MotorWidget();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        child:
        new Text(
          "Motor",
          style: new TextStyle(fontSize:12.0,
              color: const Color(0xFFffffff),
              fontWeight: FontWeight.w200,
              fontFamily: "Roboto"),
        ),

        padding: const EdgeInsets.all(0.0),
        alignment: Alignment.center,
      ),
    );
  }
}