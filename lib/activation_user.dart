import 'package:flutter/material.dart';
import 'package:merkuri/apis/api_resend_activation_code.dart';
import 'package:merkuri/apis/api_user_activation.dart';
import 'package:merkuri/globals/variable.dart';
import 'package:merkuri/profile.dart';
import 'package:merkuri/welcome_page.dart';

class ActivationUser extends StatefulWidget {
  @override
  _ActivationUserState createState() => _ActivationUserState();
}

class _ActivationUserState extends State<ActivationUser> {

  final codeEditTextController = TextEditingController();

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
                ),
                Container(
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
                    children: [
                      Text(
                        'Aktifasi User',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold
                        ),
                      ),SizedBox(
                        height: 16.0,
                      ),
                      Container(
                        child: Text(
                          'Mohon masukkan kode aktifasi yang dikirimkan ke email anda',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                          ),
                        ),
                      ),SizedBox(
                        height: 24.0,
                      ),TextFormField(
                        controller: codeEditTextController,
                        decoration: new InputDecoration(
                          labelText: "Kode Aktifasi",
                          fillColor: Colors.white,
                          //fillColor: Colors.green
                        ),
                        keyboardType: TextInputType.emailAddress,
                        style: new TextStyle(
                          fontFamily: "Poppins",
                        ),
                      ),SizedBox(
                        height: 16.0,
                      ),
                      GestureDetector(
                        onTap: (){
                          showCircular(context);
                          futureApiResendActivationCode(current_user.email).then((value){
                            Navigator.of(context, rootNavigator: true).pop();
                            if(value.isSuccess()){
                              alertDialog(context, "Kirim Ulang Kode Berhasil", "");
                            }else{
                              alertDialog(context, "Kirim Ulang Kode Gagal", "");
                            }
                          });
                        },
                        child: Text(
                          'Kirim Ulang',
                          style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline),
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
                            futureApiUserActivation(current_user.email, codeEditTextController.text)
                                .then((value){
                              Navigator.of(context, rootNavigator: true).pop();
                              if(value.isSuccess()) {
                                nextPage(context, WelcomePage());
                              } else {
                                alertDialog(context, "Aktivasi Gagal", value.message);
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
