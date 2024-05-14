import 'package:flutter/material.dart';
import 'package:pod_i_ya/core/style/text_styles.dart';
import 'package:pod_i_ya/core/widgets/event_card/event_card.dart';
import 'package:pod_i_ya/features/main_app/data/datasource/city_datasource.dart';
import 'package:pod_i_ya/features/main_app/data/model/event_model.dart';
import 'package:pod_i_ya/features/subscriptions_page/data/datasource/subscriprions_datasource.dart';

class SubscriptionPage extends StatefulWidget {
  const SubscriptionPage({
    super.key,
  });

  @override
  State<SubscriptionPage> createState() => _SubscriptionPageState();
}

class _SubscriptionPageState extends State<SubscriptionPage> {
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

  Widget catalog = const CircularProgressIndicator();

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    var data = SubscriptionsDatasourceImpl();
    if (await data.getEventsByPage(page)) {
      events = data.events!;
      setState(() {
        events;
      });
    }
    maxPages = data.numPages!;
    var newData = CityDatasourceImpl();
    await newData.getCity(3);
    for (int i = 0; i < cities.length; i++) {
      if (await newData.getCity(events![i].city!)) {
        cities[i] = newData.city!;
        setState(() {
          catalog =
              Catalog(events: events, nullEvent: nullEvent, cities: cities);
        });
      }
    }
  }

  String leftButton(){
    if(page == 1){
      return page.toString();
    }else {
      return (page - 1).toString();
    }
  }

  String rightButton(){
    if(page == 1){
      return "3";
    }
    if(page == maxPages){
      return page.toString();
    }else {
      return (page + 1).toString();
    }
  }

  String centralButton(){
    if(page == 1){
      return "2";
    }
    if(page == maxPages){
      return (page - 1).toString();
    }else {
      return page.toString();
    }
  }

  Color pageButtonColor(int? num, {bool central = false}){
    if(central){
      if(page == 1 || page == maxPages){
        return const Color(0x80967595);
      }
      return const Color(0xff967595);
    }
    if(page == num){
      return const Color(0xff967595);
    }
    return const Color(0x80967595);
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
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
                  backgroundColor: MaterialStateProperty.all(const Color(0x80967595)),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Text(leftButton(), style: const Font().copyWith(color: const Color(0xff000000),),),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(pageButtonColor(1)),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Text(centralButton(), style: const Font().copyWith(color: const Color(0xff000000),),),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(pageButtonColor(null, central: true)),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Text(rightButton(), style: const Font().copyWith(color: const Color(0xff000000),),),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(pageButtonColor(maxPages)),
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
                  backgroundColor: MaterialStateProperty.all(const Color(0x80967595)),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class Catalog extends StatelessWidget {
  const Catalog({
    super.key,
    required this.events,
    required this.nullEvent,
    required this.cities,
  });

  final List<EventModel>? events;
  final EventModel nullEvent;
  final List<String> cities;

  List<Widget> body(){
    List<Widget> widgets = [];
    for(int i = 0; i < events!.length; i++)
      {
        widgets.add(EventCard(
          eventModel: events?[i] ?? nullEvent,
          city: cities[i],
        ));
      }
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: body(),
      ),
    );
  }
}
