import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pod_i_ya/core/style/text_styles.dart';
import 'package:pod_i_ya/features/logging/presentation/entering_pages/components/common/code_text_field.dart';
import 'package:pod_i_ya/features/logging/presentation/password_change/components/password_change_validate_button.dart';

class ResetPasswordValidatePage extends StatefulWidget {
  final Map<String, dynamic> data;
  const ResetPasswordValidatePage({super.key, required this.data});

  @override
  State<ResetPasswordValidatePage> createState() =>
      _ResetPasswordValidatePageState();
}

class _ResetPasswordValidatePageState
    extends State<ResetPasswordValidatePage> {
  final _codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(children: [
          const Spacer(
            flex: 8,
          ),
          Text(
            "Email approve".tr(),
            style: const Font().s30,
          ),
          const Spacer(
            flex: 8,
          ),
          CodeTextField(codeController: _codeController),
          const Spacer(
            flex: 2,
          ),
          const Spacer(
            flex: 18,
          ),
          PasswordChangeValidateButton(
              widget: widget, codeController: _codeController),
          const Spacer(
            flex: 4,
          ),
        ]),
      ),
    );
  }
}
