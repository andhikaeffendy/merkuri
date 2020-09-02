import 'dart:io';
import 'package:dio/dio.dart';
import 'package:merkuri/models/global_response.dart';
import 'package:merkuri/globals/variable.dart';

Future<GlobalResponse> futureApiCreateMercurisk(String token, int state_id,
    int district_id, int sub_district_id, int air, int waiter,
    int soil, int human, int biota, int sediment) async{
  var dio = Dio();
  String url = api_url + "mercurisks/create";
  dio.options.headers[HttpHeaders.authorizationHeader] =
      'Bearer ' + token;
  FormData formData = new FormData.fromMap({
    "state_id": state_id,
    "district_id": district_id,
    "sub_district_id": sub_district_id,
    "air": air,
    "waiter": waiter,
    "soil": soil,
    "human": human,
    "biota": biota,
    "sediment": sediment,
  });
  Response response = await dio.post(url, data: formData);
  print(response.data);

  return GlobalResponse.fromStringJson(response.toString());
}