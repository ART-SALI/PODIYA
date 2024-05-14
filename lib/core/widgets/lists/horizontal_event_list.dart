import 'package:flutter/material.dart';
import 'package:pod_i_ya/core/widgets/event_card/event_card.dart';
import 'package:pod_i_ya/features/main_app/data/model/event_model.dart';

class HorizontalEventList extends StatefulWidget {
  final List<EventModel>? events;
  final List<String> cities;

  const HorizontalEventList({
    super.key,
    this.events, required this.cities,
  });

  @override
  State<HorizontalEventList> createState() => _HorizontalEventListState();
}

class _HorizontalEventListState extends State<HorizontalEventList> {
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


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      child: Column(
        children: [
          SizedBox(
            height: 183.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                EventCard(eventModel: widget.events?[0] ?? nullEvent, city: widget.cities[0],),
                EventCard(eventModel: widget.events?[1] ?? nullEvent, city: widget.cities[1],),
                EventCard(eventModel: widget.events?[2] ?? nullEvent, city: widget.cities[2],),
                EventCard(eventModel: widget.events?[3] ?? nullEvent, city: widget.cities[3],),
                EventCard(eventModel: widget.events?[4] ?? nullEvent, city: widget.cities[4],),
              ],
            ),
          )
        ],
      ),
    );
  }
}


