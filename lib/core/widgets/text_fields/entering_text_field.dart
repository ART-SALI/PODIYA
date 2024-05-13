import 'package:flutter/material.dart';
import 'package:pod_i_ya/core/style/text_styles.dart';
import 'package:pod_i_ya/core/style/theme.dart';

class EnteringTextField extends TextField {
  EnteringTextField({
    required Color fillColor,
    required Color textColor,
    Key? key,
    TextEditingController? controller,
    String? hintText,
  }) : super(
    key: key,
    controller: controller,
    style: const Font().s16.copyWith(color: textColor),
    decoration: InputDecoration(
      filled: true,
      fillColor: fillColor,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(32.0),
      ),
      hintText: hintText,
    ),
  );
}