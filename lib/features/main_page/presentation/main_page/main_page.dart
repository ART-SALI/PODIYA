import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pod_i_ya/core/style/text_styles.dart';
import 'package:pod_i_ya/core/widgets/lists/horizontal_event_list.dart';
import 'package:pod_i_ya/features/event_catalog/presentation/catalog_page.dart';
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
    if (await data.getEvents()) {
      events = data.events!;
      setState(() {
        events;
      });
    }
    data = DatasourceImpl();
    if (await data.getWeekEvents()) {
      eventsOfWeek = data.events!;
      setState(() {
        eventsOfWeek;
      });
    }
    var newData = CityDatasourceImpl();
    await newData.getCity(3);
    for (int i = 0; i < cities.length; i++) {
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
    return Navigator(
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          builder: (BuildContext context) {
            return ListView(
              children: [
                Column(
                  children: [
                    TitleBox(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("This week".tr()),
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                "See all".tr(),
                                style: Font().copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onBackground),
                              )),
                        ],
                      ),
                    ),
                    HorizontalEventList(
                      events: eventsOfWeek,
                      cities: cities,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Catalog".tr()),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => CatalogPage()),
                              );
                            },
                            child: Text(
                              "See all".tr(),
                              style: Font().copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onBackground),
                            ),
                          ),
                        ],
                      ),
                    ),
                    HorizontalEventList(
                      events: events,
                      cities: cities,
                    ),
                    TagList(),
                  ],
                )
              ],
            );
          },
        );
      },
    );
  }
}
