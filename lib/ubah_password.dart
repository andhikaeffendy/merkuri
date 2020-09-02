import 'package:flutter/material.dart';

class UbahPassword extends StatefulWidget {
  @override
  _UbahPasswordState createState() => _UbahPasswordState();
}

class _UbahPasswordState extends State<UbahPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.orange,
          ),
          Center(
            child: SingleChildScrollView(
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://www.enteron.no/wp-content/uploads/2018/11/nku-change-password.png'),
                      radius: 50.0,
                    ),SizedBox(
                      height: 16.0,
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
                          ),
                          TextFormField(
                            obscureText: true,
                            decoration: new InputDecoration(
                              labelText: "Password Lama",
                              fillColor: Colors.white,
                            ),
                            keyboardType: TextInputType.emailAddress,
                            style: new TextStyle(
                              fontFamily: "Poppins",
                                fontSize: 14.0
                            ),
                          ),
                          SizedBox(
                            height: 16.0,
                          ),
                          TextFormField(
                            obscureText: true,
                            decoration: new InputDecoration(
                              labelText: "Password baru",
                              fillColor: Colors.white,
                            ),
                            keyboardType: TextInputType.emailAddress,
                            style: new TextStyle(
                              fontFamily: "Poppins",
                                fontSize: 14.0
                            ),
                          ),
                          SizedBox(
                            height: 14.0,
                          ),
                          TextFormField(
                            obscureText: true,
                            decoration: new InputDecoration(
                              labelText: "Konfirmasi Password Baru",
                              fillColor: Colors.white,
                            ),
                            keyboardType: TextInputType.emailAddress,
                            style: new TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 14.0
                            ),
                          ),
                          SizedBox(
                            height: 16.0,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: FlatButton(
                              onPressed: () {},
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              color: Colors.orange,
                              child: Container(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'Ganti Password',
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
