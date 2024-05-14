import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pod_i_ya/core/widgets/text_fields/entering_text_field.dart';

class CodeTextField extends StatelessWidget {
  const CodeTextField({
    super.key,
    required TextEditingController codeController,
  }) : _codeController = codeController;

  final TextEditingController _codeController;

  @override
  Widget build(BuildContext context) {
    return EnteringTextField(
      textColor: Theme.of(context).colorScheme.onBackground,
      fillColor: Theme.of(context).colorScheme.primaryContainer,
      controller: _codeController,
      hintText: "Code".tr(),
    );
  }
}