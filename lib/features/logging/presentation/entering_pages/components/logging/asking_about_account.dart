import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pod_i_ya/core/widgets/buttons/underlined_text_button.dart';
import 'package:pod_i_ya/features/logging/presentation/entering_pages/registration.dart';

class AskingAboutAccount extends StatelessWidget {
  const AskingAboutAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Do not have account?".tr()),
        UnderlinedTextButton(
          text: "registration".tr(),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const RegistrationPage()));
          },
        ),
      ],
    );
  }
}