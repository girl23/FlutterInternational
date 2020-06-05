import 'package:customtabbar/first.dart';
import 'package:flutter/material.dart';
import 'bottom_tab_bar.dart';
import 'fifth.dart';
import 'second.dart';
import 'third.dart';
import 'forth.dart';
import 'fifth.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController _tabController;
  int _selectedIndex = 0;
  String badgeNo1;
  var titles = ['home', 'video', 'find', 'smallvideo', 'my'];
  var icons = [
    Icons.home,
    Icons.play_arrow,
    Icons.child_friendly,
    Icons.fiber_new,
    Icons.mic_none
  ];
  @override
  void initState() {

    super.initState();
    _tabController =
    new TabController(vsync: this, initialIndex: 1, length: titles.length);
    badgeNo1 = '12';
  }

  void _onItemSelected(int index) {
    setState(() {
      _selectedIndex = index;
//      badgeNo1 = '';
    });
  }

//  final _widgetOptions = [
//    Text('Index 0: Home'),
//    Text('Index 1: Video'),
//    Text('Index 2: find someone'),
//    Text('Index 3: small Video'),
//    Text('Index 4: My'),
//  ];
  List<Widget>_widgetOptions=[
    First(),
    Second(),
    Third(),
    Forth(),
    Fifth(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bottom Tab Bar'),
      ),
      bottomNavigationBar: BottomTabBar(
        items: <BottomTabBarItem>[
          BottomTabBarItem(
              icon: Icon(icons[0]), title: Text(titles[0]), badgeNo: badgeNo1),
          BottomTabBarItem(icon: Icon(icons[1]), title: Text(titles[1])),
          BottomTabBarItem(icon: Icon(icons[2]), title: Text(titles[2])),
          BottomTabBarItem(
              icon: Icon(icons[3]),
              activeIcon: Icon(icons[3]),
              title: Text(titles[3])),
          BottomTabBarItem(icon: Icon(icons[4]), title: Text(titles[4])),
        ],
        fixedColor: Colors.blue,
        currentIndex: _selectedIndex,
        onTap: _onItemSelected,
        type: BottomTabBarType.fixed,
        isAnimation: false,
        isInkResponse: false,
        badgeColor: Colors.green,

      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
    );
  }
}

