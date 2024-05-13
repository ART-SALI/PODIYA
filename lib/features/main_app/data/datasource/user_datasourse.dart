import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pod_i_ya/features/main_app/data/datasource/_datasource.dart';
import 'package:pod_i_ya/features/main_app/data/model/user_info_model.dart';

class UserDatasourceImpl extends Datasource{

  UserDatasourceImpl();

  String? token;
  UserInfoModel? userInfoModel;
  UserProfileModel? userProfileModel;

  Future<bool> getUserInfo() async {

    var headers = {
      'Content-Type': 'application/json; charset=utf-16',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };

    Uri api = Uri.parse('http://51.44.28.183:8000/api/users/about-me/');

    http.Response response = await http.get(api, headers: headers);


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