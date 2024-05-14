import 'package:flutter/material.dart';
import 'package:pod_i_ya/core/widgets/event_card/event_card.dart';
import 'package:pod_i_ya/features/main_app/data/model/event_model.dart';

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