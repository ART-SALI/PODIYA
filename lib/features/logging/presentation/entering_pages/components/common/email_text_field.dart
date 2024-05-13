import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pod_i_ya/core/widgets/text_fields/entering_text_field.dart';

class EmailTextField extends StatelessWidget {
  const EmailTextField({
    super.key,
    required TextEditingController emailController,
  }) : _emailController = emailController;

  final TextEditingController _emailController;

  @override
  Widget build(BuildContext context) {
    return EnteringTextField(
      textColor: Theme.of(context).colorScheme.onPrimaryContainer,
      fillColor: Theme.of(context).colorScheme.primaryContainer,
      controller: _emailController,
      hintText: "Email".tr(),
    );
  }
}