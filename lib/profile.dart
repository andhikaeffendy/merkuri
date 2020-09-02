import 'package:flutter/material.dart';
import 'package:merkuri/apis/api_profile.dart';
import 'package:merkuri/globals/variable.dart';
import 'package:merkuri/models/user.dart';
import 'package:merkuri/page_settings.dart';
import 'package:merkuri/ubah_password.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  User user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 230.0,
            color: Colors.orange,
          ),
          FutureBuilder(
            future: futureApiProfile(current_user.token),
            builder: (context, snapshot) {
              if(snapshot.connectionState == ConnectionState.waiting ){
                return Center(
                  child: new CircularProgressIndicator(),
                );
              } else if(snapshot.connectionState == ConnectionState.done){
                ApiProfile apiProfile = snapshot.data;
                if(apiProfile.isSuccess()){
                  user = apiProfile.user;
                  return profileView();
                }
                alertDialog(context, "Profile", apiProfile.message);
                return Container(width: 0.0, height: 0.0);
              } else {
                return Container(width: 0.0, height: 0.0);
              }
            },
          ),
        ],
      ),
    );
  }

  Widget profileView(){
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20.0,
            ),
            CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://i.pinimg.com/736x/63/7a/52/637a524d0c56abac8e43918b6a05643c.jpg'),
              radius: 50.0,
            ),
            SizedBox(
              height: 16.0,
            ),
            Text(
              user.name,
              style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 24.0,
            ),
            Container(
              width: 300.0,
              margin: EdgeInsets.only(left: 16.0, right: 16.0),
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                boxShadow: [
                  BoxShadow(
                      offset: const Offset(3.0, 3.0),
                      blurRadius: 5.0,
                      spreadRadius: 2.0,
                      color: Colors.black38),
                ],
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25.0),
                    bottomRight: Radius.circular(25.0)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 16.0,
                  ),Align(
                    alignment: Alignment.center,
                    child: Text(
                      'User Profile',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),SizedBox(
                    height: 24.0,
                  ),Text(
                    'Nama Lengkap',
                    style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),SizedBox(
                    height: 12.0,
                  ),Text(
                    user.name,
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.black,),
                  ),SizedBox(
                    height: 16.0,
                  ),Text(
                    'Email',
                    style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),SizedBox(
                    height: 12.0,
                  ),Text(
                    user.email,
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.black,),
                  ),SizedBox(
                    height: 16.0,
                  ),Text(
                    'No Telp',
                    style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),SizedBox(
                    height: 12.0,
                  ),Text(
                    '-',
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.black,),
                  ),SizedBox(
                    height: 16.0,
                  ),Text(
                    'Tanggal Lahir',
                    style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),SizedBox(
                    height: 12.0,
                  ),Text(
                    '-',
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.black,),
                  ),SizedBox(
                    height: 16.0,
                  ),Text(
                    'Jenis Kelamin',
                    style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),SizedBox(
                    height: 12.0,
                  ),Text(
                    '-',
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.black,),
                  ),SizedBox(
                    height: 16.0,
                  ),SizedBox(
                    width: double.infinity,
                    child: FlatButton(
                      onPressed: () {
                       Navigator.push(
                         context,
                         MaterialPageRoute(builder: (context) => UbahPassword()),
                       );
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      color: Colors.orange,
                      child: Container(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Ubah Password',
                          style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),SizedBox(
                    height: 16.0,
                  )
                ],
              ),
            ),SizedBox(
              height: 16.0,
            )
          ],
        ),
      ),
    );
  }
}
