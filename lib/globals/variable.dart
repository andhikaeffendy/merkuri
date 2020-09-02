import 'package:flutter/material.dart';
import 'package:merkuri/models/province.dart';
import 'package:merkuri/models/user.dart';

String domain = "https://mercurisk.wiradipa.com";
String api_url = domain+"/api/v1/";

User current_user;
List<Province> provinces;

showCircular(context){
  showDialog(
      context: context,
      child: new Center(
        child: new CircularProgressIndicator(),
      )
  );
}

alertDialog(context, title, message){
  showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text(title),
          content: Text(message),
        );
      }
  );
}

nextPage(context, page){
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => page),
  );
}

startNewPage(context, page){
  Navigator.pushAndRemoveUntil(
      context,
      new MaterialPageRoute(
        builder: (context) => page,
      ), (route) => false);
}