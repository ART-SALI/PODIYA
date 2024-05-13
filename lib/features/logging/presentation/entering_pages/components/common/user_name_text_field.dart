import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pod_i_ya/core/widgets/text_fields/entering_text_field.dart';

class UserNameTextField extends StatelessWidget {
  const UserNameTextField({
    super.key,
    required TextEditingController userNameController,
  }) : _userNameController = userNameController;

  final TextEditingController _userNameController;

  @override
  Widget build(BuildContext context) {
    return EnteringTextField(
      textColor: Theme.of(context).colorScheme.onPrimaryContainer,
      fillColor: Theme.of(context).colorScheme.primaryContainer,
      controller: _userNameController,
      hintText: "User name".tr(),
    );
  }
}