import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pod_i_ya/core/style/text_styles.dart';

class ChoosePriceWidget extends StatelessWidget {
  const ChoosePriceWidget({
    super.key,
    required this.loverPriceController,
    required this.upperPriceController,
  });

  final TextEditingController loverPriceController;
  final TextEditingController upperPriceController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "From".tr(),
          style: const Font().copyWith(
              color: Theme.of(context).colorScheme.onBackground),
        ),
        PriceTextField(loverPriceController: loverPriceController),
        Text(
          "to".tr(),
          style: const Font().copyWith(
              color: Theme.of(context).colorScheme.onBackground),
        ),
        PriceTextField(loverPriceController: upperPriceController),
      ],
    );
  }
}

class PriceTextField extends StatelessWidget {
  const PriceTextField({
    super.key,
    required this.loverPriceController,
  });

  final TextEditingController loverPriceController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
      width: 100,
      child: TextField(
        inputFormatters:  <TextInputFormatter>[
          FilteringTextInputFormatter.allow(RegExp(r'^(\d+)?\.?\d{0,2}')), //only double values
        ],
        controller: loverPriceController,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32.0),
          ),),
      ),
    );
  }
}