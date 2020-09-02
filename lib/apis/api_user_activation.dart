import 'package:dio/dio.dart';
import 'package:merkuri/models/global_response.dart';
import 'package:merkuri/globals/variable.dart';

Future<GlobalResponse> futureApiUserActivation(String email,
    String activation_code) async{
  var dio = Dio();
  String url = api_url + "activation";
  FormData formData = new FormData.fromMap({
    "email": email,
    "activation_code": activation_code,
  });
  Response response = await dio.post(url, data: formData);
  print(response.data);

  return GlobalResponse.fromStringJson(response.toString());
}