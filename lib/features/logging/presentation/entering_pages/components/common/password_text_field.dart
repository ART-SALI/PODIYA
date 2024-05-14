import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pod_i_ya/core/widgets/text_fields/entering_text_field.dart';

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({
    super.key,
    required TextEditingController passwordController,
  }) : _passwordController = passwordController;

  final TextEditingController _passwordController;

  @override
  Widget build(BuildContext context) {
    return EnteringTextField(
      textColor: Theme.of(context).colorScheme.onBackground,
      fillColor: Theme.of(context).colorScheme.primaryContainer,
      controller: _passwordController,
      hintText: "Password".tr(),
    );
  }
}