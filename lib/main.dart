import 'package:flutter/material.dart';
import 'package:merkuri/apis/api_logout.dart';
import 'package:merkuri/apis/api_states.dart';
import 'package:merkuri/data_merkurisk.dart';
import 'package:merkuri/globals/variable.dart';
import 'package:merkuri/login.dart';
import 'package:merkuri/lupa_password.dart';
import 'package:merkuri/mapview.dart';
import 'package:merkuri/profile.dart';
import 'package:merkuri/register.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation Drawer',
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
        primarySwatch: Colors.orange,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Login(),
    );
  }
}

class DrawerItem {
  String title;
  IconData icon;
  DrawerItem(this.title, this.icon);
}

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key key,
  }) : super(key: key);

  final drawerItems = [
    new DrawerItem("Home", Icons.home),
    new DrawerItem("Data Merkurisk", Icons.data_usage),
    new DrawerItem("Profile", Icons.person),
    new DrawerItem("Settings", Icons.settings),
    new DrawerItem("Logout", Icons.exit_to_app),
  ];

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  DateTime backbuttonpressedTime;
  int _selectedDrawerIndex = 0;

  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return new MapView();
      case 1:
        return new DataMerkurisk();
      case 2:
        return new Profile();
      case 3:
        return new Container();
      case 4:
        return new Container();
      default:
        return new Text("Error");
    }
  }

  _onSelectItem(int index) {
    if(index == 4){
      showCircular(context);
      futureApiLogout(current_user.token).then((value){
        Navigator.of(context, rootNavigator: true).pop();
        current_user = null;
        startNewPage(context, Login());
      });
    } else {
      setState(() => _selectedDrawerIndex = index);
      Navigator.of(context).pop(); // close the drawer
    }
  }

  @override
  Widget build(BuildContext context) {
    var drawerOptions = <Widget>[];
    for (var i = 0; i < widget.drawerItems.length; i++) {
      var d = widget.drawerItems[i];
      drawerOptions.add(
          new ListTile(
            leading: new Icon(d.icon),
            title: new Text(d.title),
            selected: i == _selectedDrawerIndex,
            onTap: () => _onSelectItem(i),
          )
      );
    }

    if(provinces == null){
      futureApiState(current_user.token).then((value){
        provinces = value.data;
      });
    }

    return WillPopScope(
      onWillPop: _onBackPressed,
      child: new Scaffold(
        appBar: new AppBar(
        // here we display the title corresponding to the fragment
        // you can instead choose to have a static title
        title: new Text(widget.drawerItems[_selectedDrawerIndex].title),
      ),
        drawer: new Drawer(
          child: new Column(
            children: <Widget>[
              new UserAccountsDrawerHeader(
                accountName: new Text(current_user.name), accountEmail: Text(current_user.email), currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://i.pinimg.com/736x/63/7a/52/637a524d0c56abac8e43918b6a05643c.jpg'),
                  radius: 30.0,
                ),
              ),
              new Column(children: drawerOptions)
            ],
          ),
        ),
        body: _getDrawerItemWidget(_selectedDrawerIndex),
      ),
    );
  }

  Future<bool> _onBackPressed() async {
    if(_selectedDrawerIndex == 0){
      DateTime currentTime = DateTime.now();
      //Statement 1 Or statement2
      bool backButton = backbuttonpressedTime == null ||
          currentTime.difference(backbuttonpressedTime) > Duration(seconds: 3);
      if (backButton) {
        backbuttonpressedTime = currentTime;
        return false;
      }
      return true;
    } else {
      setState(() {
        _selectedDrawerIndex = 0;
      });
      return false;
    }
  }
}
