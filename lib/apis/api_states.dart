import 'dart:io';
import 'package:dio/dio.dart';
import 'package:merkuri/globals/variable.dart';
import 'dart:convert';

import 'package:merkuri/models/province.dart';

Future<ApiState> futureApiState(String token) async{
  var dio = Dio();
  String url = api_url + "states";
  dio.options.headers[HttpHeaders.authorizationHeader] =
      'Bearer ' + token;
  Response response = await dio.get(url);
  print(response.data);

  return ApiState.fromStringJson(response.toString());
}

class ApiState {
  String status;
  String message;
  List<Province> data;

  ApiState({
    this.status,
    this.message,
    this.data,
  });

  ApiState.fromJson(Map<String, dynamic> json) :
        status = json["status"],
        message = json["message"],
        data = List<Province>.from(json["data"].map((x) => Province.fromJson(x)));

  ApiState.fromStringJson(String stringJson) :
        this.fromJson(json.decode(stringJson));

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };

  String toStringJson() => json.encode(this.toJson());

  bool isSuccess() => status == "success";
}