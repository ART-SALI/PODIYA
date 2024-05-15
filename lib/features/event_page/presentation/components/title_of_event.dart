import 'package:flutter/material.dart';
import 'package:pod_i_ya/core/style/text_styles.dart';
import 'package:pod_i_ya/features/event_page/presentation/event_page.dart';


class TitleOfEvent extends StatelessWidget {
  const TitleOfEvent({
    super.key,
    required this.widget,
    required this.child,
  });

  final Widget child;
  final EventPage widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        color: Theme.of(context).colorScheme.primary,
      ),
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(8),
      child: child,
    );
  }
}