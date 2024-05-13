import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pod_i_ya/core/widgets/lists/horizontal_event_list.dart';
import 'package:pod_i_ya/features/main_app/data/datasource/_datasource.dart';
import 'package:pod_i_ya/features/main_app/data/datasource/city_datasource.dart';
import 'package:pod_i_ya/features/main_app/data/model/event_model.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({
    super.key
  });

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {


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
    if (await data.getEvents()) {
      events = data.events!;
      setState(() {
        events;
      });
    }
    data = DatasourceImpl();
    if (await data.getEvents()) {
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
                Container(
                  height: 72,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    color: Color(0xaa785396),
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    children: [
                      Icon(Icons.search),
                      Container(
                        height: 64,
                        width: 100,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "What are your plans for your free time?"
                                .tr(),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                HorizontalEventList(events: eventsOfWeek,cities: cities,),
                HorizontalEventList(events: events,cities: cities,),
              ],
            );
          },
        );
      });
    }
  }
