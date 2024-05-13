import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pod_i_ya/core/widgets/buttons/underlined_text_button.dart';
import 'package:pod_i_ya/features/logging/presentation/password_change/reset_password.dart';

class RestorePassword extends StatelessWidget {
  const RestorePassword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        UnderlinedTextButton(
          text: "restore password".tr(),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const RestorePasswordPage()));
          },
        ),
      ],
    );
  }
}