import 'package:flutter/material.dart';
import 'package:pod_i_ya/core/style/text_styles.dart';
import 'package:pod_i_ya/features/event_page/presentation/event_page.dart';

class EventDescription extends StatelessWidget {
  const EventDescription({
    super.key,
    required this.widget,
  });

  final EventPage widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.only(top: 20, bottom: 100),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        color: Theme.of(context).colorScheme.secondaryContainer,
      ),
      child: Text(widget.eventModel.description!, style:
      const Font().s16.copyWith(color: Theme.of(context).colorScheme.onSecondaryContainer), ),
    );
  }
}