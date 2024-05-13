import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pod_i_ya/core/widgets/text_fields/entering_text_field.dart';

class NewPasswordTextField extends StatelessWidget {
  const NewPasswordTextField({
    super.key,
    required TextEditingController newPasswordController,
  }) : _newPasswordController = newPasswordController;

  final TextEditingController _newPasswordController;

  @override
  Widget build(BuildContext context) {
    return EnteringTextField(
      textColor: Theme.of(context).colorScheme.onPrimaryContainer,
      fillColor: Theme.of(context).colorScheme.primaryContainer,
      controller: _newPasswordController,
      hintText: "New password".tr(),
    );
  }
}