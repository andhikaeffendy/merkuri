import 'dart:io';
import 'package:dio/dio.dart';
import 'package:merkuri/models/global_response.dart';
import 'package:merkuri/globals/variable.dart';

Future<GlobalResponse> futureApiCheckUser(String token, String email) async{
  var dio = Dio();
  String url = api_url + "check_user";
  dio.options.headers[HttpHeaders.authorizationHeader] =
      'Bearer ' + token;
  FormData formData = new FormData.fromMap({
    "email": email,
  });
  Response response = await dio.post(url, data: formData);
  print(response.data);

  return GlobalResponse.fromStringJson(response.toString());
}