import 'package:flutter/material.dart';
import 'package:merkuri/page_settings.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 230.0,
            color: Colors.orange,
          ),
          SingleChildScrollView(
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
                    'Yatogami',
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
                          'Andhika Dwi Putra Effendy',
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
                          'Andhikaeffendy14@gmail.com',
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
                          '082198113362',
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
                          '14/08/1997',
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
                          'Laki-laki',
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
                                MaterialPageRoute(builder: (context) => Profile()),
                              );
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            color: Colors.orange,
                            child: Container(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Edit Profile',
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
          )
        ],
      ),
    );
  }
}
