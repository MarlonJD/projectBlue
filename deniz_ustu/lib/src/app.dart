import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';
import 'package:denizustu/src/ui/genel.dart';
import 'package:denizustu/src/ui/kontrol.dart';


class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Flutter App',
      theme: new ThemeData(
        brightness:Brightness.dark,
        primarySwatch: Colors.blue,
        primaryColor: const Color(0xFF041D37),
        accentColor: const Color(0xFF64ffda),
        canvasColor: Color(0xFF2B4C6F),
        fontFamily: 'Roboto',
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    GenelWidget(),
    KontrolWidget(),
    GenelWidget()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GFAppBar(
        centerTitle: true,
        title: Text("Deniz Üstü"),
        actions: <Widget>[
          GFIconButton(
            icon: Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
            onPressed: () {},
            type: GFButtonType.transparent,
          ),
        ],
      ),
      body: _children[_currentIndex], // new
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF133253),
        onTap: onTabTapped, // new
        currentIndex: _currentIndex, // new
        items: [
          new BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Genel'),
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text('Kontrol'),
          ),
          new BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text('Profile')
          )
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}