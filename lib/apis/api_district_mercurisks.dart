import 'dart:io';
import 'package:dio/dio.dart';
import 'package:merkuri/models/district_mercurisk.dart';
import 'package:merkuri/globals/variable.dart';
import 'dart:convert';

Future<ApiDistrictMercurisk> futureApiDistrictMercurisks(String token, int id) async{
  var dio = Dio();
  String url = api_url + "district_mercurisks/"+id.toString();
  dio.options.headers[HttpHeaders.authorizationHeader] =
      'Bearer ' + token;
  Response response = await dio.get(url);
  print(response.data);

  return ApiDistrictMercurisk.fromStringJson(response.toString());
}

class ApiDistrictMercurisk {
  String status;
  String message;
  List<DistrictMerkurisk> data;

  ApiDistrictMercurisk({
    this.status,
    this.message,
    this.data,
  });

  ApiDistrictMercurisk.fromJson(Map<String, dynamic> json) :
        status = json["status"],
        message = json["message"],
        data = List<DistrictMerkurisk>.from(json["data"].map((x) => DistrictMerkurisk.fromJson(x)));

  ApiDistrictMercurisk.fromStringJson(String stringJson) :
        this.fromJson(json.decode(stringJson));

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };

  String toStringJson() => json.encode(this.toJson());

  bool isSuccess() => status == "success";
}