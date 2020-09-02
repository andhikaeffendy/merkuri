import 'package:dio/dio.dart';
import 'package:merkuri/models/global_response.dart';
import 'package:merkuri/globals/variable.dart';

Future<GlobalResponse> futureApiResetPassword(String email) async{
  var dio = Dio();
  String url = api_url + "reset_password";
  FormData formData = new FormData.fromMap({
    "email": email,
  });
  Response response = await dio.post(url, data: formData);
  print(response.data);

  return GlobalResponse.fromStringJson(response.toString());
}