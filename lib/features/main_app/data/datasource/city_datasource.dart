
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pod_i_ya/features/main_app/data/datasource/_datasource.dart';


class CityDatasourceImpl extends Datasource{

  String? city;

  List<String>? cities;

  CityDatasourceImpl();

 Future<bool> getCity(int cityNum) async {
    var headers = {
      'Content-Type': 'application/json; charset=utf-16',
      'Accept': 'application/json',
    };


    Uri api = Uri.parse('http://51.44.28.183:8000/api/events/cities/$cityNum/');

    http.Response response = await http.get(api, headers: headers);

    if (response.statusCode == 200) {
      var data = json.decode(utf8.decode(response.bodyBytes)) as Map;
      city = data["name"];
      print(city);
      return true;
    }
    else {
      print(response.reasonPhrase);
      city = "Бориспіль";
      print(city);
      return false;
    }


  }

  Future<bool> getAllCity() async {
    var headers = {
      'Content-Type': 'application/json; charset=utf-16',
      'Accept': 'application/json',
    };


    Uri api = Uri.parse('http://51.44.28.183:8000/api/events/cities/?page_size=458');

    http.Response response = await http.get(api, headers: headers);

    if (response.statusCode == 200) {
      var data = json.decode(utf8.decode(response.bodyBytes)) as Map;
      cities = (data["results"] as List).map((i) => i["name"] as String).toList();
      print(cities);
      return true;
    }
    else {
      print(response.reasonPhrase);
      city = "Бориспіль";
      print(city);
      return false;
    }


  }
}