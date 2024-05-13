import 'package:flutter/material.dart';
import 'package:pod_i_ya/core/style/text_styles.dart';

class UnderlinedTextButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;

  const UnderlinedTextButton({
    super.key, required this.text, this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: onPressed, child: Text(text, style: Font().underline.purple,), style: ButtonStyle(),);
  }
}