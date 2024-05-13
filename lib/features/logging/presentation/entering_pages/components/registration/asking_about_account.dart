import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/widgets/buttons/underlined_text_button.dart';

class AskingAboutAccount extends StatelessWidget {
  const AskingAboutAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Do not have accaunt?".tr()),
        UnderlinedTextButton(text: "logging".tr(), onPressed: (){
          Navigator.of(context).pop();
        },)
      ],
    );
  }
}