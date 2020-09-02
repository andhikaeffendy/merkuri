import 'package:flutter/material.dart';
import 'package:merkuri/apis/api_reset_password.dart';
import 'package:merkuri/globals/variable.dart';
import 'package:merkuri/login.dart';
import 'package:merkuri/main.dart';

class LupaPasswordDone extends StatefulWidget {
  @override
  _LupaPasswordDoneState createState() => _LupaPasswordDoneState();
}

class _LupaPasswordDoneState extends State<LupaPasswordDone> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.orange,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/Mercurisk.png',
                  height: MediaQuery.of(context).size.width * 0.25,
                  width: MediaQuery.of(context).size.width * 0.8,
                  fit: BoxFit.fill,
                ),Text(
                  'how much mercury pollutes your place',
                  style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),SizedBox(
                  height: 16.0,
                ),Container(
                  margin: EdgeInsets.all(16.0),
                  child: Text(
                    'Kami Telah mengirimkan password anda di email anda',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 16.0,
                ),Container(
                  margin: EdgeInsets.only(left: 16.0, right: 16.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: FlatButton(
                      onPressed: () {
                        showCircular(context);
                        futureApiResetPassword(current_user.email).then((value){
                          Navigator.of(context, rootNavigator: true).pop();
                          if(value.isSuccess()){
                            alertDialog(context, "Reset Password Berhasil", "");
                          } else {
                            alertDialog(context, "Reset Password Gagal", value.message);
                          }
                        });
//                    Navigator.push(
//                      context,
//                      MaterialPageRoute(builder: (context) => MyHomePage()),
//                    );
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      color: Colors.white,
                      child: Container(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Kirim Ulang',
                          style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ),Container(
                  margin: EdgeInsets.only(left: 16.0, right: 16.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: FlatButton(
                      onPressed: () {
                        startNewPage(context, Login());
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      color: Colors.white,
                      child: Container(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Ke Halaman Login',
                          style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
