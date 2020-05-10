import 'package:denizustu/src/api/api_service.dart';
import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';
import 'package:control_pad/control_pad.dart';
import 'package:video_player/video_player.dart';
import 'package:denizustu/src/model/post.dart';
import 'dart:async';

class GenelWidget extends StatefulWidget {
  @override
  _GenelWidgetState createState() => _GenelWidgetState();
}

class _GenelWidgetState extends State<GenelWidget> with AutomaticKeepAliveClientMixin<GenelWidget> {
  VideoPlayerController _controller;
  ApiService apiService;
  BuildContext context;
  Row _staticRow;

  @override
  bool get wantKeepAlive => true; // ** and here

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

    // _fetchData() is your function to fetch data
    Timer.periodic(Duration(milliseconds: 500), (Timer t) => _fetchData());
    _staticRow = Row(
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
                    ]);
  }

  void _fetchData() {
    if (!mounted) return;
    setState(() {
      apiService = ApiService();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          //color: const Color(0xFF212121),
          padding: EdgeInsets.all(5),
          child: 
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
                  future: apiService.getSensors(),
                  builder:
                      (BuildContext context, AsyncSnapshot<Sensor> snapshot) {
                    if (snapshot.hasData) {
                      return Row(
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
                                      text: "${snapshot.data.motorDevri} RPM",
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
                                      text: "${snapshot.data.derinlik} m",
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
                                      text: "${snapshot.data.basinc} Pa",
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
                                      text: "${snapshot.data.sicaklik} °C",
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
                      );
                    } else if (snapshot.hasError) {
                      /* return Center(
                        child: Text(
                            "Something wrong with message: ${snapshot.error.toString()}"),
                      ); */
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return SizedBox(
                        child: CircularProgressIndicator(),
                        width: 60,
                        height: 60,
                      );
                    }
                  },
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                ),
                _staticRow
              ],
            )
          ),
    );
  }


  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
