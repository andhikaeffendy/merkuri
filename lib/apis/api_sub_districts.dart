import 'dart:io';
import 'package:dio/dio.dart';
import 'package:merkuri/globals/variable.dart';
import 'dart:convert';

import 'package:merkuri/models/sub_district.dart';

Future<ApiSubDistrict> futureApiSubDistrict(String token, int id) async{
  var dio = Dio();
  String url = api_url + "sub_districts/"+id.toString();
  dio.options.headers[HttpHeaders.authorizationHeader] =
      'Bearer ' + token;
  Response response = await dio.get(url);
  print(response.data);

  return ApiSubDistrict.fromStringJson(response.toString());
}

class ApiSubDistrict {
  String status;
  String message;
  List<SubDistrict> data;

  ApiSubDistrict({
    this.status,
    this.message,
    this.data,
  });

  ApiSubDistrict.fromJson(Map<String, dynamic> json) :
        status = json["status"],
        message = json["message"],
        data = List<SubDistrict>.from(json["data"].map((x) => SubDistrict.fromJson(x)));

  ApiSubDistrict.fromStringJson(String stringJson) :
        this.fromJson(json.decode(stringJson));

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };

  String toStringJson() => json.encode(this.toJson());

  bool isSuccess() => status == "success";
}