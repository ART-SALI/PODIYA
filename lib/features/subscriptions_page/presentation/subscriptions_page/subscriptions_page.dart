import 'package:flutter/material.dart';
import 'package:pod_i_ya/features/main_app/data/datasource/_datasource.dart';
import 'package:pod_i_ya/features/main_app/data/datasource/city_datasource.dart';
import 'package:pod_i_ya/features/main_app/data/model/event_model.dart';

class SubscriptionPage extends StatefulWidget {
  const SubscriptionPage({
    super.key,
  });

  @override
  State<SubscriptionPage> createState() => _SubscriptionPageState();
}

class _SubscriptionPageState extends State<SubscriptionPage> {
  List<EventModel>? events;
  List<String> cities = ['', '', '', '', ''];

  Future<void> getData() async {
    var data = DatasourceImpl();
    if (await data.getEvents()) {
      events = data.events!;
      setState(() {
        events;
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
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Color(0x80967595), shape: BoxShape.circle),
                child: TextButton(
                  onPressed: () {},
                  child: Icon(Icons.arrow_left_outlined),
                  style: ButtonStyle(),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text('1'),
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32.0),
                            side: BorderSide(color: Colors.red)))),
              ),
              TextButton(
                onPressed: () {},
                child: Text('2'),
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32.0),
                            side: BorderSide(color: Colors.red)))),
              ),
              TextButton(
                onPressed: () {},
                child: Text('3'),
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32.0),
                            side: BorderSide(color: Colors.red)))),
              ),
              TextButton(
                onPressed: () {},
                child: Icon(Icons.arrow_right_outlined),
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32.0),
                            side: BorderSide(color: Colors.red)))),
              ),
            ],
          ),
        )
      ],
    );
  }
}
