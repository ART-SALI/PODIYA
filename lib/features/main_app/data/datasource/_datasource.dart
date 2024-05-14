import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pod_i_ya/features/main_app/data/model/event_model.dart';

abstract class Datasource {
}

class DatasourceImpl implements Datasource {

  var currentPage;
  List<EventModel>? events;

  DatasourceImpl();

  Future<bool> getAllEvents() async {

    Uri api = Uri.parse('http://51.44.28.183:8000/api/events');

    http.Response response = await http.get(api);

    if (response.statusCode == 200) {
      // print(json.decode(response.body));
      currentPage = response.body;
      return true;
    }
    else {
      print(response.reasonPhrase);
      return false;
    }

  }

  Future<bool> getAllEventsByPage(int page) async {

    Uri api = Uri.parse('http://51.44.28.183:8000/api/events/?page_size=5/?page=$page');

    http.Response response = await http.get(api);

    if (response.statusCode == 200) {
      print(json.decode(response.body));
      // currentPage = response.body;
      return true;
    }
    else {
      print(response.reasonPhrase);
      return false;
    }

  }

  Future<bool> getWeekEvents() async {

    var headers = {
      'Content-Type': 'application/json; charset=utf-16',
      'Accept': 'application/json',
    };

    Uri api = Uri.parse('http://51.44.28.183:8000/api/events/current_week_events/?page_size=5');

    http.Response response = await http.get(api, headers: headers);


    if (response.statusCode == 200) {
      // print(json.decode(response.body));
      currentPage = json.decode(utf8.decode(response.bodyBytes)) as Map;
      events=(currentPage["results"] as List).map((i) => EventModel.fromJson(i)).toList();
      // print(events.toString());
      return true;
    }
    else {
      print(response.reasonPhrase);
      return false;
    }

  }

  Future<bool> getEvents() async {

    var headers = {
      'Accept': 'application/json',
    };

    Uri api = Uri.parse('http://51.44.28.183:8000/api/events/?page_size=5');

    http.Response response = await http.get(api, headers: headers);


    if (response.statusCode == 200) {
      print(json.decode(response.body));
      currentPage = json.decode(utf8.decode(response.bodyBytes)) as Map;
      events=(currentPage["results"] as List).map((i) => EventModel.fromJson(i)).toList();
      // print(events.toString());
      return true;
    }
    else {
      print(response.reasonPhrase);
      return false;
    }

  }

}
