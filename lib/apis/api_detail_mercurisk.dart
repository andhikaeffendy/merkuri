import 'dart:io';
import 'package:dio/dio.dart';
import 'package:merkuri/models/merkurisk.dart';
import 'package:merkuri/globals/variable.dart';
import 'dart:convert';

Future<ApiMercurisk> futureApiDetailMercurisk(String token, int id) async{
  var dio = Dio();
  String url = api_url + "mercurisks/"+ id.toString();
  dio.options.headers[HttpHeaders.authorizationHeader] =
      'Bearer ' + token;
  Response response = await dio.get(url);
  print(response.data);

  return ApiMercurisk.fromStringJson(response.toString());
}

class ApiMercurisk {
  String status;
  String message;
  Merkurisk merkurisk;

  ApiMercurisk({
    this.status,
    this.message,
    this.merkurisk,
  });

  ApiMercurisk.fromJson(Map<String, dynamic> json) :
        status = json["status"],
        message = json["message"],
        merkurisk = Merkurisk.fromJson(json);

  ApiMercurisk.fromStringJson(String stringJson) :
        this.fromJson(json.decode(stringJson));

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "id": merkurisk.id,
    "state_id": merkurisk.state_id,
    "district_id": merkurisk.district_id,
    "sub_district_id": merkurisk.sub_district_id,
    "air": merkurisk.air,
    "waiter": merkurisk.waiter,
    "soil": merkurisk.soil,
    "human": merkurisk.human,
    "biota": merkurisk.biota,
    "sediment": merkurisk.sediment,
  };

  String toStringJson() => json.encode(this.toJson());

  bool isSuccess() => status == "success";
}