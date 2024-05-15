import 'package:flutter/material.dart';

class FilterLine extends StatelessWidget {
  const FilterLine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 2,
      color: Theme.of(context).colorScheme.onBackground,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
    );
  }
}
