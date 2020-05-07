import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';
import 'package:control_pad/control_pad.dart';
import 'package:video_player/video_player.dart';

class GenelWidget extends StatefulWidget {
  @override
  _GenelWidgetState createState() => _GenelWidgetState();
}

class _GenelWidgetState extends State<GenelWidget> {
  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/WhatCarCanYouGetForAGrand.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
    _controller.play();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: const Color(0xFF212121),
          padding: EdgeInsets.all(5),
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              _controller.value.initialized
                  ? AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    )
                  : Container(),
              Padding(
                padding: EdgeInsets.all(10),
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Card(
                        child: ListTile(
                          leading: FlutterLogo(),
                          title: Text('One-line with leading widget'),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          title: Text('One-line with trailing widget'),
                          trailing: Icon(Icons.more_vert),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Card(
                        child: ListTile(
                          leading: FlutterLogo(),
                          title: Text('One-line with leading widget'),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          title: Text('One-line with trailing widget'),
                          trailing: Icon(Icons.more_vert),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.all(10),
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    JoystickView(size: 100),
                    GFIconButton(
                      color: Colors.blueGrey,
                      onPressed: () {},
                      icon: Icon(Icons.keyboard_arrow_up),
                      shape: GFIconButtonShape.circle,
                    ),
                    GFIconButton(
                      color: Colors.blueGrey,
                      onPressed: () {},
                      icon: Icon(Icons.keyboard_arrow_down),
                      shape: GFIconButtonShape.circle,
                    ),
                  ])
            ],
          )),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
