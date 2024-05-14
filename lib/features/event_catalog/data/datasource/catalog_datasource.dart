import 'package:pod_i_ya/features/main_app/data/model/event_model.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;
import '../../../main_app/data/datasource/_datasource.dart';

class CatalogDatasourceImpl implements Datasource {

  var currentPage;
  List<EventModel>? events;
  int? numPages;

  CatalogDatasourceImpl();

  Future<bool> getEventsByPage(int page) async {

    var headers = {
      'Accept': 'application/json',
    };

    Uri api = Uri.parse('http://51.44.28.183:8000/api/events/?page=$page&page_size=4');

    http.Response response = await http.get(api, headers: headers);


    if (response.statusCode == 200) {
      print(json.decode(response.body));
      currentPage = json.decode(utf8.decode(response.bodyBytes)) as Map;
      events=(currentPage["results"] as List).map((i) => EventModel.fromJson(i)).toList();
      numPages = currentPage["num_pages"];
      print(events.toString());
      return true;
    }
    else {
      print(response.reasonPhrase);
      return false;
    }

  }

}