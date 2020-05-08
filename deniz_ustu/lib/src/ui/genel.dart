import 'package:denizustu/src/api/api_service.dart';
import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';
import 'package:control_pad/control_pad.dart';
import 'package:video_player/video_player.dart';
import 'package:denizustu/src/model/post.dart';

class GenelWidget extends StatefulWidget {
  @override
  _GenelWidgetState createState() => _GenelWidgetState();
}

class _GenelWidgetState extends State<GenelWidget> {
  VideoPlayerController _controller;
  ApiService apiService;
  BuildContext context;

  @override
  void initState() {
    super.initState();
    apiService = ApiService();
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
      body: ListView(
          //color: const Color(0xFF212121),
          padding: EdgeInsets.all(5),
          children: [
            Column(
              children: [
                _controller.value.initialized
                    ? AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: VideoPlayer(_controller),
                      )
                    : Container(),
                Padding(
                  padding: EdgeInsets.all(5),
                ),
                FutureBuilder(
        future: apiService.getPosts(),
        builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                  "Something wrong with message: ${snapshot.error.toString()}"),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            List<Post> posts = snapshot.data;
            return Row(
      children: <Widget>[
        ListView.builder(
        itemBuilder: (context, index) {
          Post post = posts[index];
          return Flexible(child: 
          Column(
            children: <Widget>[
              Text(post.userId.toString()), Text(post.id.toString())
            ],
          ));
        })
            ]);

          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Flexible(
                      child: Column(
                        children: <Widget>[
                          Card(
                            child: GFListTile(
                              color: Color(0xFF4A6A8A),
                              margin: EdgeInsets.zero,
                              title: GFTypography(
                                text: 'Motor Deviri',
                                type: GFTypographyType.typo5,
                                showDivider: false,
                                textColor: Colors.white,
                              ),
                              subTitle: GFTypography(
                                text: '0 RPM',
                                type: GFTypographyType.typo6,
                                showDivider: false,
                                textColor: Color(0xFF738CA6),
                              ),
                            ),
                          ),
                          Card(
                            child: GFListTile(
                              color: Color(0xFF4A6A8A),
                              margin: EdgeInsets.zero,
                              title: GFTypography(
                                text: 'Derinlik',
                                type: GFTypographyType.typo5,
                                showDivider: false,
                                textColor: Colors.white,
                              ),
                              subTitle: GFTypography(
                                text: '0 m',
                                type: GFTypographyType.typo6,
                                showDivider: false,
                                textColor: Color(0xFF738CA6),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      child: Column(
                        children: <Widget>[
                          Card(
                            child: GFListTile(
                              color: Color(0xFF4A6A8A),
                              margin: EdgeInsets.zero,
                              title: GFTypography(
                                text: 'Basınç',
                                type: GFTypographyType.typo5,
                                showDivider: false,
                                textColor: Colors.white,
                              ),
                              subTitle: GFTypography(
                                text: '0 Pa',
                                type: GFTypographyType.typo6,
                                showDivider: false,
                                textColor: Color(0xFF738CA6),
                              ),
                            ),
                          ),
                          Card(
                            child: GFListTile(
                              color: Color(0xFF4A6A8A),
                              margin: EdgeInsets.zero,
                              title: GFTypography(
                                text: 'Sıcaklık',
                                type: GFTypographyType.typo5,
                                showDivider: false,
                                textColor: Colors.white,
                              ),
                              subTitle: GFTypography(
                                text: '0 °C',
                                type: GFTypographyType.typo6,
                                showDivider: false,
                                textColor: Color(0xFF738CA6),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(5),
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
            )
          ]),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
