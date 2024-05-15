import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pod_i_ya/features/main_app/data/datasource/_datasource.dart';

class TagsDatasourceImpl extends Datasource {
  String? tag;

  List<String> tags = [];

  TagsDatasourceImpl();

  Future<bool> getTag(int tagNum) async {
    var headers = {
      'Content-Type': 'application/json; charset=utf-16',
      'Accept': 'application/json',
    };

    Uri api = Uri.parse('http://51.44.28.183:8000/api/events/tags/$tagNum/');

    http.Response response = await http.get(api, headers: headers);

    if (response.statusCode == 200) {
      var data = json.decode(utf8.decode(response.bodyBytes)) as Map;
      tag = data["name"];
      print(tag);
      return true;
    } else {
      print(response.reasonPhrase);
      tag = "Бориспіль";
      print(tag);
      return false;
    }
  }

  Future<bool> getAllTags() async {
    var headers = {
      'Content-Type': 'application/json; charset=utf-16',
      'Accept': 'application/json',
    };

    Uri api = Uri.parse('http://51.44.28.183:8000/api/events/tags/');

    http.Response response = await http.get(api, headers: headers);

    if (response.statusCode == 200) {
      var data = json.decode(utf8.decode(response.bodyBytes)) as List;
      tags = data.map((i) => i["name"] as String).toList();
      print(tags);
      return true;
    } else {
      print(response.reasonPhrase);
      tag = "Бориспіль";
      print(tag);
      return false;
    }
  }

  Future<bool> getUserTags(List<dynamic> userTags) async {
    var headers = {
      'Content-Type': 'application/json; charset=utf-16',
      'Accept': 'application/json',
    };

    Uri api = Uri.parse('http://51.44.28.183:8000/api/events/tags/');

    http.Response response = await http.get(api, headers: headers);

    if (response.statusCode == 200) {
      var data = json.decode(utf8.decode(response.bodyBytes)) as List;
      for(int i = 0; i < userTags.length; i++){
        tags.add(data[userTags[i]]["name"]);
      }
      print(tags);
      return true;
    } else {
      print(response.reasonPhrase);
      tag = "Бориспіль";
      print(tag);
      return false;
    }
  }
}
