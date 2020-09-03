import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:merkuri/activation_user.dart';
import 'package:merkuri/apis/api_register.dart';
import 'package:merkuri/globals/variable.dart';
import 'package:merkuri/models/user.dart';
import 'package:merkuri/welcome_page.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  DateTime selectedDate = DateTime.now();
  String _date = "Tanggal lahir";

  final emailEditTextController = TextEditingController();
  final passwordEditTextController = TextEditingController();
  final passwordConfirmationEditTextController = TextEditingController();
  final nameEditTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(top: 40.0),
            color: Colors.orange,
          ),Center(
            child: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.only(top: 40.0, left: 16.0, right: 16.0, bottom: 16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
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
                          'REGISTER',
                          style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold
                          ),
                        ),SizedBox(
                          height: 24.0,
                        ),
                        TextFormField(
                          controller: nameEditTextController,
                          decoration: new InputDecoration(
                            labelText: "Nama Lengkap",
                            fillColor: Colors.white,
                            //fillColor: Colors.green
                          ),
                          keyboardType: TextInputType.emailAddress,
                          style: new TextStyle(
                            fontFamily: "Poppins",
                          ),
                        ),SizedBox(
                          height: 16.0,
                        ),RaisedButton(
                          onPressed: () {
                            DatePicker.showDatePicker(context,
                                theme: DatePickerTheme(
                                  containerHeight: 210.0,
                                ),
                                showTitleActions: true,
                                minTime: DateTime(0, 1, 1),
                                maxTime: DateTime(2022, 12, 31), onConfirm: (date) {
                                  print('confirm $date');
                                  _date = '${date.year} - ${date.month} - ${date.day}';
                                  setState(() {});
                                }, currentTime: DateTime.now(), locale: LocaleType.en);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 50.0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Container(
                                      child: Row(
                                        children: <Widget>[
                                          Icon(
                                            Icons.date_range,
                                            size: 18.0,
                                            color: Colors.black,
                                          ),
                                          Text(
                                            " $_date",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14.0),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                Text(
                                  "  Change",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.0),
                                ),
                              ],
                            ),
                          ),
                          color: Colors.white,
                        ),SizedBox(
                          height: 16.0,
                        ),TextFormField(
                          controller: emailEditTextController,
                          decoration: new InputDecoration(
                            labelText: "Email",
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
                        TextFormField(
                          decoration: new InputDecoration(
                            labelText: "No Telp",
                            fillColor: Colors.white,
                          ),
                          keyboardType: TextInputType.emailAddress,
                          style: new TextStyle(
                            fontFamily: "Poppins",
                          ),
                        ),SizedBox(
                          height: 16.0,
                        ),
                        TextFormField(
                          controller: passwordEditTextController,
                          obscureText: true,
                          decoration: new InputDecoration(
                            labelText: "Masukkan Password",
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
                        TextFormField(
                          controller: passwordConfirmationEditTextController,
                          obscureText: true,
                          decoration: new InputDecoration(
                            labelText: "Konfirmasi Password",
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
                              current_user = User(null, emailEditTextController.text, nameEditTextController.text, null);
                              futureApiRegister(emailEditTextController.text, nameEditTextController.text,
                                  passwordEditTextController.text, passwordConfirmationEditTextController.text)
                                  .then((value) {
                                Navigator.of(context, rootNavigator: true).pop();
                                if(value.isSuccess()){
                                  nextPage(context, ActivationUser());
                                } else {
                                  alertDialog(context, "Register Gagal", value.message);
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
                                'Register',
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
