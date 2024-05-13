import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pod_i_ya/core/style/text_styles.dart';

class TitleBox extends StatelessWidget {
  const TitleBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      height: 102,
      width: 335,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        color: Theme.of(context).colorScheme.tertiary,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "City in your hand!".tr(),
            style: const Font().s30,
          ),
          Text("We will find what you are interested in!".tr())
        ],
      ),
    );
  }
}