import 'package:flutter/material.dart';
import 'page_settings.dart';

class Sidebar extends StatefulWidget {
  @override
  _SidebarState createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'AppBar'
        ),
      ),drawer: Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text('Yatogami'),
            accountEmail: Text('andhikaeffendy14@gmail.com'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://i.pinimg.com/736x/63/7a/52/637a524d0c56abac8e43918b6a05643c.jpg'),
              radius: 50.0,
            ),
          ),ListTile(
            title: Text(
              'Halaman dah'
            ),
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PageSettings()),
              );
            },
          )
        ],
      ),
    ),
    );
  }
}
