import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pod_i_ya/core/style/text_styles.dart';

class TagsTitleText extends StatelessWidget {
  const TagsTitleText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12, bottom: 8),
      child: Text(
        "Tags".tr(),
        style: const Font().w600.s20.copyWith(
            color: Theme.of(context).colorScheme.onBackground),
      ),
    );
  }
}