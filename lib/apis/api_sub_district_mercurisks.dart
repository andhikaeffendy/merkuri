import 'dart:io';
import 'package:dio/dio.dart';
import 'package:merkuri/models/sub_district_mercurisk.dart';
import 'package:merkuri/globals/variable.dart';
import 'dart:convert';

Future<ApiSubDistrictMercurisk> futureApiSubDistrictMercurisks(String token, int id) async{
  var dio = Dio();
  String url = api_url + "sub_district_mercurisks/"+id.toString();
  dio.options.headers[HttpHeaders.authorizationHeader] =
      'Bearer ' + token;
  Response response = await dio.get(url);
  print(response.data);

  return ApiSubDistrictMercurisk.fromStringJson(response.toString());
}

class ApiSubDistrictMercurisk {
  String status;
  String message;
  List<SubDistrictMerkurisk> data;

  ApiSubDistrictMercurisk({
    this.status,
    this.message,
    this.data,
  });

  ApiSubDistrictMercurisk.fromJson(Map<String, dynamic> json) :
        status = json["status"],
        message = json["message"],
        data = List<SubDistrictMerkurisk>.from(json["data"].map((x) => SubDistrictMerkurisk.fromJson(x)));

  ApiSubDistrictMercurisk.fromStringJson(String stringJson) :
        this.fromJson(json.decode(stringJson));

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };

  String toStringJson() => json.encode(this.toJson());

  bool isSuccess() => status == "success";
}