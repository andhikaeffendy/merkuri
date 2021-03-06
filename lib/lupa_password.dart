import 'package:flutter/material.dart';
import 'package:merkuri/apis/api_reset_password.dart';
import 'package:merkuri/globals/variable.dart';
import 'package:merkuri/lupa_password_done.dart';
import 'package:merkuri/models/user.dart';

class LupaPassword extends StatefulWidget {
  @override
  _LupaPasswordState createState() => _LupaPasswordState();
}

class _LupaPasswordState extends State<LupaPassword> {

  final emailEditTextController = TextEditingController();

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
                ),
                Text(
                  'how much mercury pollutes your place',
                  style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 16.0,
                ),Container(
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
                            color: Colors.black38
                        ),
                      ],
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25.0),
                          bottomRight: Radius.circular(25.0)),
                    ),child: Column(
                  children: [
                    Text(
                      'Lupa Password',
                      style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                      ),
                    ),SizedBox(
                      height: 24.0,
                    ),TextFormField(
                      controller: emailEditTextController,
                      decoration: new InputDecoration(
                        labelText: "Masukkan Email Anda",
                        fillColor: Colors.white,
                        //fillColor: Colors.green
                      ),
                      keyboardType: TextInputType.emailAddress,
                      style: new TextStyle(
                        fontFamily: "Poppins",
                      ),
                    ),SizedBox(
                      height: 16.0,
                    ),SizedBox(
                      width: double.infinity,
                      child: FlatButton(
                        onPressed: () {
                          showCircular(context);
                          futureApiResetPassword(emailEditTextController.text).then((value){
                            Navigator.of(context, rootNavigator: true).pop();
                            if(value.isSuccess()){
                              current_user = new User(null, emailEditTextController.text, null, null);
                              nextPage(context, LupaPasswordDone());
                            } else {
                              alertDialog(context, "Reset Password Gagal", value.message);
                            }
                          });
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        color: Colors.orange,
                        child: Container(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Enter',
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
          )
        ],
      ),
    );
  }
}
