import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pod_i_ya/core/style/text_styles.dart';
import 'package:pod_i_ya/features/event_page/presentation/event_page.dart';

class EventDateText extends StatelessWidget {
  const EventDateText({
    required this.widget,
    super.key,
  });

  final EventPage widget;

  @override
  Widget build(BuildContext context) {
    return Text(
      DateFormat('dd MMMM yyyy hh:mm')
          .format(widget.eventModel.time!)
          .toString(),
      style:
      const Font().s16.copyWith(color: Theme.of(context).colorScheme.onPrimary),
    );
  }
}