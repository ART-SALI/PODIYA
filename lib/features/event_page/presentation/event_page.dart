import 'package:flutter/material.dart';
import 'package:pod_i_ya/core/style/text_styles.dart';
import 'package:pod_i_ya/features/event_page/presentation/components/event_date_text.dart';
import 'package:pod_i_ya/features/event_page/presentation/components/event_description.dart';
import 'package:pod_i_ya/features/event_page/presentation/components/event_location_text.dart';
import 'package:pod_i_ya/features/event_page/presentation/components/event_name_text.dart';
import 'package:pod_i_ya/features/event_page/presentation/components/poster.dart';
import 'package:pod_i_ya/features/event_page/presentation/components/tags_title_text.dart';
import 'package:pod_i_ya/features/event_page/presentation/components/title_of_event.dart';
import 'package:pod_i_ya/features/main_app/data/datasource/tags_datasource.dart';
import 'package:pod_i_ya/features/main_app/data/model/event_model.dart';

class EventPage extends StatefulWidget {
  final EventModel eventModel;
  final String city;
  const EventPage({super.key, required this.eventModel, required this.city});

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  List<String> tags = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    var tagsData = TagsDatasourceImpl();
    if (await tagsData.getUserTags(widget.eventModel.tags as List<dynamic>)) {
      setState(() {
        tags = tagsData.tags;
      });
    }
  }

  List<Widget> getTags(){
    List<Widget> tagContainers = [];
    for(int i = 0; i < tags.length; i++){
      tagContainers.add(Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: Theme.of(context).colorScheme.primary,
        ),
        child: Text(tags[i], style:
        const Font().s16.copyWith(color: Theme.of(context).colorScheme.onPrimary),
        ),
      )
      );
    }
    return tagContainers;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      floatingActionButton: Container(
        height: 50,
        padding: const EdgeInsets.all(2.0),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: Theme.of(context).colorScheme.primary,
        ),
        child: TextButton(onPressed: () {  },
        child: Text('Buy a ticket', style:
        const Font().s16.copyWith(color: Theme.of(context).colorScheme.onPrimary), ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            Poster(widget: widget),
            TitleOfEvent(
              widget: widget,
              child: EventNameText(widget: widget),
            ),
            TitleOfEvent(
              widget: widget,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  EventDateText(
                    widget: widget,
                  ),
                  EventLocationText(widget: widget)
                ],
              ),
            ),
            const TagsTitleText(),
            Wrap(
              spacing: 4,
              children: getTags(),
            ),
            EventDescription(widget: widget)
          ],
        ),
      ),
    );

  }
}

