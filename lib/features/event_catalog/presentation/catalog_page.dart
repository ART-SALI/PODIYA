import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pod_i_ya/core/style/text_styles.dart';
import 'package:pod_i_ya/core/widgets/app_bars/base_app_bar.dart';
import 'package:pod_i_ya/features/event_catalog/data/datasource/catalog_datasource.dart';
import 'package:pod_i_ya/features/event_catalog/presentation/components/catalog.dart';
import 'package:pod_i_ya/features/event_catalog/presentation/filters_page.dart';
import 'package:pod_i_ya/features/main_app/data/datasource/city_datasource.dart';
import 'package:pod_i_ya/features/main_app/data/model/event_model.dart';

class CatalogPage extends StatefulWidget {
  const CatalogPage({
    super.key,
  });

  @override
  State<CatalogPage> createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  EventModel nullEvent = EventModel(
      id: -1,
      rating: -1,
      name: "-1",
      description: "-1",
      price: -1,
      image: "error",
      location: "-1",
      time: DateTime.now(),
      created_at: DateTime.now(),
      city: -1,
      creator: -1,
      tags: null);

  List<EventModel>? events;
  List<String> cities = ['', '', '', '', ''];
  int page = 1;
  int maxPages = 1;

  Map<String, dynamic>filter = {
    "tags" : [],
    "fromDate" : null,
    "toDate" : null,
    "loverPrice" : -1,
    "upperPrice" : -1,
    "city": null,
  };

  Widget catalog = const CircularProgressIndicator();

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    var data = CatalogDatasourceImpl();
    if (await data.getEventsByPageAndFilter(page, filter)) {
      events = data.events!;
      setState(() {
        events;
      });
    }
    maxPages = data.numPages!;
    var newData = CityDatasourceImpl();
    await newData.getCity(3);
    for (int i = 0; i < events!.length; i++) {
      if (await newData.getCity(events![i].city!)) {
        cities[i] = newData.city!;
        setState(() {
          catalog =
              Catalog(events: events, nullEvent: nullEvent, cities: cities);
        });
      }
    }
  }

  String leftButton() {
    if (page == 1) {
      return page.toString();
    } else {
      return (page - 1).toString();
    }
  }

  String rightButton() {
    if (page == 1) {
      return "3";
    }
    if (page == maxPages) {
      return page.toString();
    } else {
      return (page + 1).toString();
    }
  }

  String centralButton() {
    if (page == 1) {
      return "2";
    }
    if (page == maxPages) {
      return (page - 1).toString();
    } else {
      return page.toString();
    }
  }

  Color pageButtonColor(int? num, {bool central = false}) {
    if (central) {
      if (page == 1 || page == maxPages) {
        return const Color(0x80967595);
      }
      return const Color(0xff967595);
    }
    if (page == num) {
      return const Color(0xff967595);
    }
    return const Color(0x80967595);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        leftWidget: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        centerWidget: Text("Catalog".tr()),
        rightWidget: IconButton(
          onPressed: () async {
           filter = await Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => const FiltersPage())) as Map<String, dynamic>;
           print(filter.toString());
           setState(() {
             getData();
           });
          },
          icon: const Icon(Icons.filter_alt_rounded),
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      body: ListView(
        children: [
          catalog,
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    if (page > 1) {
                      page--;
                      getData();
                    }
                  },
                  icon: const Icon(
                    Icons.arrow_left_outlined,
                    color: Color(0xff000000),
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(const Color(0x80967595)),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    if (page > 1) {
                      page--;
                      getData();
                    }
                  },
                  icon: Text(
                    leftButton(),
                    style: const Font().copyWith(
                      color: const Color(0xff000000),
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(pageButtonColor(1)),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    if (page == 1 && maxPages > 1) {
                      page++;
                      getData();
                    } else if (page == maxPages && maxPages > 2) {
                      page--;
                      getData();
                    }
                  },
                  icon: Text(
                    centralButton(),
                    style: const Font().copyWith(
                      color: const Color(0xff000000),
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        pageButtonColor(null, central: true)),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    if (page < maxPages) {
                      page += 1;
                      getData();
                    }
                  },
                  icon: Text(
                    rightButton(),
                    style: const Font().copyWith(
                      color: const Color(0xff000000),
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(pageButtonColor(maxPages)),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    if (page < maxPages) {
                      page += 1;
                      getData();
                    }
                  },
                  icon: const Icon(
                    Icons.arrow_right_outlined,
                    color: Color(0xff000000),
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(const Color(0x80967595)),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
