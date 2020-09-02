import 'dart:io';
import 'package:dio/dio.dart';
import 'package:merkuri/models/merkurisk.dart';
import 'package:merkuri/globals/variable.dart';
import 'dart:convert';

Future<ApiMercurisk> futureApiMercurisks(String token) async{
  var dio = Dio();
  String url = api_url + "mercurisks";
  dio.options.headers[HttpHeaders.authorizationHeader] =
      'Bearer ' + token;
  Response response = await dio.get(url);
  print(response.data);

  return ApiMercurisk.fromStringJson(response.toString());
}

class ApiMercurisk {
  String status;
  String message;
  List<Merkurisk> data;

  ApiMercurisk({
    this.status,
    this.message,
    this.data,
  });

  ApiMercurisk.fromJson(Map<String, dynamic> json) :
        status = json["status"],
        message = json["message"],
        data = List<Merkurisk>.from(json["data"].map((x) => Merkurisk.fromJson(x)));

  ApiMercurisk.fromStringJson(String stringJson) :
        this.fromJson(json.decode(stringJson));

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };

  String toStringJson() => json.encode(this.toJson());

  bool isSuccess() => status == "success";
}