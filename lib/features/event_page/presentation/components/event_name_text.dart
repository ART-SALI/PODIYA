import 'package:flutter/material.dart';
import 'package:pod_i_ya/core/style/text_styles.dart';
import 'package:pod_i_ya/features/event_page/presentation/event_page.dart';

class EventNameText extends StatelessWidget {
  const EventNameText({
    super.key,
    required this.widget,
  });

  final EventPage widget;

  @override
  Widget build(BuildContext context) {
    return Text(
      widget.eventModel.name!,
      style: const Font().s16.w600.copyWith(
        color: Theme.of(context).colorScheme.onPrimary,
      ),
      textAlign: TextAlign.center,
    );
  }
}

