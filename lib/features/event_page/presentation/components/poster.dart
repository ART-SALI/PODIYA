import 'package:flutter/material.dart';
import 'package:pod_i_ya/features/event_page/presentation/event_page.dart';

class Poster extends StatelessWidget {
  const Poster({
    super.key,
    required this.widget,
  });

  final EventPage widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        image: DecorationImage(
          image: NetworkImage(widget.eventModel.image!),
          fit: BoxFit.cover,
        ),
      ),
      width: 335,
      height: 200,
    );
  }
}