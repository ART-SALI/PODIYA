import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:pod_i_ya/features/logging/data/models/_model.dart';

abstract class Datasource {
  Future<bool> postCreateNewUser(Map<String, dynamic> newUser);
}

class DatasourceImpl implements Datasource {

  UserModel? userModel;
  String? token;
  final Dio dio;

  DatasourceImpl({required this.dio});

  Future<bool> postUserLogin( Map<String, dynamic> user ) async {

    Uri api = Uri.parse('http://51.44.28.183:8000/api/users/login/');

    http.Response response = await http.post(api,
        body: user
    );

    if (response.statusCode == 200) {
      print(json.decode(response.body));
      userModel = UserModel.fromJson(json.decode(response.body));
      token = userModel!.token;
      return true;
    }
    else {
      print(response.reasonPhrase);
      return false;
    }


  }

  Future<bool> postVerefiNewUserSend( Map<String, dynamic> newUser ) async {

    print(newUser);
    // var request = http.Request('POST', Uri.parse('http://51.44.28.183:8000/api/users/email_verify/'));
    // Map<String, dynamic> data = {};
    // data["email"] = newUser["email"].toString();
    // request.body = {"email": "rekudaasnin@gmail.com"} as String;
    //
    // print(request.body);

    http.Response response = await http.post(Uri.parse('http://51.44.28.183:8000/api/users/email_verify/'),
      body: {"email": newUser["email"]}
    );


    if (response.statusCode == 200) {
      print(json.decode(response.body));
    }
    else {
      print(response.reasonPhrase);
    }
    return true;
  }

  Future<bool> postVerefiNewUser( Map<String, dynamic> data, Map<String, dynamic> newUser ) async {

    print(data);

    Uri api = Uri.parse('http://51.44.28.183:8000/api/users/email_verify_validate/');

    http.Response response = await http.post(api,
        body: data
    );


    if (response.statusCode == 200) {
      print(json.decode(response.body));
    }
    else {
      print(response.reasonPhrase);
    }

    postCreateNewUser(newUser);

    return true;
  }


  @override
  Future<bool> postCreateNewUser( Map<String, dynamic> newUser ) async {

    Uri api = Uri.parse('http://51.44.28.183:8000/api/users/create/');
    // var request = await dio.post(api, data: newUser);
    http.Response response = await http.post(api, body: newUser);
    print(json.decode(response.body));
    return true;
  }

  Future<bool> postResetPassword( Map<String, dynamic> user ) async {

    Uri api = Uri.parse('http://51.44.28.183:8000/api/users/password_reset/');

    http.Response response = await http.post(api,
        body: user
    );

    if (response.statusCode == 200) {
      print(json.decode(response.body));
      return true;
    }
    else {
      print(response.reasonPhrase);
      return false;
    }


  }

  Future<bool> postResetPasswordValidate( Map<String, dynamic> user ) async {

    Uri api = Uri.parse('http://51.44.28.183:8000/api/users/password_change_verify_validate/');

    http.Response response = await http.post(api,
        body: user
    );

    if (response.statusCode == 200) {
      print(json.decode(response.body));
      return true;
    }
    else {
      print(response.reasonPhrase);
      return false;
    }


  }

  Future<bool> postSetNewPassword( Map<String, dynamic> user ) async {

    Uri api = Uri.parse('http://51.44.28.183:8000/api/users/change-password/');

    http.Response response = await http.put(api,
        body: user
    );

    if (response.statusCode == 200) {
      print(json.decode(response.body));
      return true;
    }
    else {
      print(response.reasonPhrase);
      return false;
    }


  }
}
