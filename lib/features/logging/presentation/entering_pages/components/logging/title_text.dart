import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pod_i_ya/core/style/text_styles.dart';

class TitleText extends StatelessWidget {
  const TitleText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      "logging".tr(),
      style: const Font()
          .s30
          .copyWith(color: Theme.of(context).colorScheme.onBackground),
    );
  }
}