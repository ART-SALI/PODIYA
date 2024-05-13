
import 'package:flutter/material.dart';
import 'package:pod_i_ya/core/widgets/lists/horizontal_event_list.dart';
import 'package:pod_i_ya/features/main_app/data/datasource/_datasource.dart';
import 'package:pod_i_ya/features/main_app/data/datasource/city_datasource.dart';
import 'package:pod_i_ya/features/main_app/data/model/event_model.dart';
import 'package:pod_i_ya/features/main_page/presentation/main_page/components/tag_list.dart';
import 'package:pod_i_ya/features/main_page/presentation/main_page/components/title_box.dart';

class MainPage extends StatefulWidget {
  const MainPage({
    super.key,
  });

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  List<EventModel>? events;
  List<EventModel>? eventsOfWeek;
  List<String> cities = ['', '', '', '', ''];

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    var data = DatasourceImpl();
    if(await data.getEvents()){
    events = data.events!;
    setState(() {
      events;
    });
    }
    data = DatasourceImpl();
    if(await data.getEvents()){
      eventsOfWeek = data.events!;
      setState(() {
        eventsOfWeek;
      });
    }
    var newData = CityDatasourceImpl();
    await newData.getCity(3);
    for(int i = 0; i < cities.length; i++) {
      if (await newData.getCity(events![i].city!)) {
        cities[i] = newData.city!;
        setState(() {
          cities[i];
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(onGenerateRoute: (RouteSettings settings) {
      return MaterialPageRoute(
        builder: (BuildContext context) {
          return ListView(
            children: [
              TitleBox(),
              HorizontalEventList(events: eventsOfWeek, cities: cities,),
              HorizontalEventList(events: events, cities: cities,),
              TagList(),
            ],
          );},);
        },
      );
  }
}





