import 'package:flutter/material.dart';
import 'package:pod_i_ya/core/style/text_styles.dart';
import 'package:pod_i_ya/features/event_page/presentation/event_page.dart';

class EventLocationText extends StatelessWidget {
  const EventLocationText({
    super.key,
    required this.widget,
  });

  final EventPage widget;

  @override
  Widget build(BuildContext context) {
    return Text(
      "${widget.city} ${widget.eventModel.location!}",
      style:
      const Font().s14.copyWith(color: Theme.of(context).colorScheme.onPrimary),
    );
  }
}