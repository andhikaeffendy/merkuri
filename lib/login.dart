import 'package:flutter/material.dart';
import 'package:merkuri/apis/api_login.dart';
import 'package:merkuri/main.dart';
import 'package:merkuri/register.dart';
import 'package:merkuri/globals/variable.dart';
import 'lupa_password.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override

  final emailEditTextController = TextEditingController();
  final passwordEditTextController = TextEditingController();

  Widget build(BuildContext context) {
    // TESTING
    emailEditTextController.text = "mreza@wiradipa.com";
    passwordEditTextController.text = "reza123";
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.orange,
          ),Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
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
                  ),
                  Container(
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
                            bottomRight: Radius.circular(25.0))),
                    padding: EdgeInsets.only(
                        top: 24.0, left: 16.0, right: 16.0, bottom: 16.0),
                    margin: EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Sign In',
                          style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold),
                        ),SizedBox(
                          height: 16.0,
                        ),
                        new TextFormField(
                          controller: emailEditTextController,
                          decoration: new InputDecoration(
                            labelText: "Email",
                            fillColor: Colors.white,
                            //fillColor: Colors.green
                          ),
                          validator: (val) {
                            if(val.length==0) {
                              return "Email cannot be empty";
                            }else{
                              return null;
                            }
                          },
                          keyboardType: TextInputType.emailAddress,
                          style: new TextStyle(
                            fontFamily: "Poppins",
                          ),
                        ),
                        SizedBox(
                          height: 16.0,
                        ),
                        new TextFormField(
                          controller: passwordEditTextController,
                          obscureText: true,
                          decoration: new InputDecoration(
                            labelText: "Password",
                            fillColor: Colors.white,
                            //fillColor: Colors.green
                          ),
                          validator: (val) {
                            if(val.length==0) {
                              return "Password cannot be empty";
                            }else{
                              return null;
                            }
                          },
                          keyboardType: TextInputType.emailAddress,
                          style: new TextStyle(
                            fontFamily: "Poppins",
                          ),
                        ),
                        SizedBox(
                          height: 16.0,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: FlatButton(
                            onPressed: () {
                              showCircular(context);
                              futureApiLogin(emailEditTextController.text, passwordEditTextController.text).then((value) {
                                Navigator.of(context, rootNavigator: true).pop();
                                if(value.isSuccess()){
                                  current_user = value.user;
                                  startNewPage(context, MyHomePage());
                                } else {
                                  alertDialog(context, "Sign In Gagal", value.message);
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
                                'Masuk',
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 16.0,
                        ),
                        GestureDetector(
                          onTap: (){
                            nextPage(context, LupaPassword());
                          },
                          child: Text(
                            'Lupa Password',
                            style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline),
                          ),
                        ),
                        SizedBox(
                          height: 16.0,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Belum punya akun? ',
                              style: TextStyle(
                                fontSize: 14.0,
                              ),
                            ),
                            GestureDetector(
                              onTap: (){
                                nextPage(context, Register());
                              },
                              child: Text(
                                'Daftar disini',
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 12.0,
                        )
                      ],
                    ),
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
