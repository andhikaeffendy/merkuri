import 'dart:io';
import 'package:dio/dio.dart';
import 'package:merkuri/models/state_mercurisk.dart';
import 'package:merkuri/globals/variable.dart';
import 'dart:convert';

Future<ApiStateMercurisk> futureApiStateMercurisks(String token) async{
  var dio = Dio();
  String url = api_url + "state_mercurisks";
  dio.options.headers[HttpHeaders.authorizationHeader] =
      'Bearer ' + token;
  Response response = await dio.get(url);
  print(response.data);

  return ApiStateMercurisk.fromStringJson(response.toString());
}

class ApiStateMercurisk {
  String status;
  String message;
  List<StateMerkurisk> data;

  ApiStateMercurisk({
    this.status,
    this.message,
    this.data,
  });

  ApiStateMercurisk.fromJson(Map<String, dynamic> json) :
        status = json["status"],
        message = json["message"],
        data = List<StateMerkurisk>.from(json["data"].map((x) => StateMerkurisk.fromJson(x)));

  ApiStateMercurisk.fromStringJson(String stringJson) :
        this.fromJson(json.decode(stringJson));

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };

  String toStringJson() => json.encode(this.toJson());

  bool isSuccess() => status == "success";
}