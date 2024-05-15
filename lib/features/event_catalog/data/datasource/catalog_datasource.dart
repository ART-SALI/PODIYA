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

  Future<bool> getEventsByPageAndFilter(int page, Map<String, dynamic> filters) async {

    var headers = {
      'Accept': 'application/json',
    };

    String filter = '';

    http://51.44.28.183:8000/api/events/
    // ?search=П
    // &date_from=2024-05-10T13:58:29.9080Z
    // &date_to=2024-05-17T13:58:29.9080Z
    // &price_from=100&price_to=1000&tags=Концерти&city=Київ&sort=price_asc'
    if(filters["fromDate"] != null){
      filter += "&date_from=${filters["fromDate"]}";
    }
    if(filters["toDate"] != null){
      filter += "&date_to=${filters["toDate"]}";
    }
    if(filters["loverPrice"] >= 0){
      filter += "&price_from=${filters["loverPrice"]}";
    }
    if(filters["upperPrice"] >= 0){
      filter += "&price_to=${filters["upperPrice"]}";
    }
    if(filters["city"] != null){
      filter += "&city=${filters["city"]}";
    }
    if((filters["tags"] as List).length > 0){
      List<dynamic> tags=filters["tags"];
      filter += "&tags=";
      for(int i = 0; i < tags.length - 1; i++){
        filter+=tags[i].toString() +",";
      }
      filter+=tags[tags.length - 1].toString();
    }

    Uri api = Uri.parse('http://51.44.28.183:8000/api/events/?page=$page&page_size=4$filter');

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