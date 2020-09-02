import 'dart:io';
import 'package:dio/dio.dart';
import 'package:merkuri/globals/variable.dart';
import 'dart:convert';

import 'package:merkuri/models/district.dart';

Future<ApiDistrict> futureApiDistrict(String token, int id) async{
  var dio = Dio();
  String url = api_url + "districts/"+id.toString();
  dio.options.headers[HttpHeaders.authorizationHeader] =
      'Bearer ' + token;
  Response response = await dio.get(url);
  print(response.data);

  return ApiDistrict.fromStringJson(response.toString());
}

class ApiDistrict {
  String status;
  String message;
  List<District> data;

  ApiDistrict({
    this.status,
    this.message,
    this.data,
  });

  ApiDistrict.fromJson(Map<String, dynamic> json) :
        status = json["status"],
        message = json["message"],
        data = List<District>.from(json["data"].map((x) => District.fromJson(x)));

  ApiDistrict.fromStringJson(String stringJson) :
        this.fromJson(json.decode(stringJson));

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };

  String toStringJson() => json.encode(this.toJson());

  bool isSuccess() => status == "success";
}