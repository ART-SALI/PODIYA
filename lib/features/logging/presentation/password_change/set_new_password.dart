import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pod_i_ya/core/style/text_styles.dart';
import 'package:pod_i_ya/features/logging/presentation/password_change/components/new_password_text_field.dart';
import 'package:pod_i_ya/features/logging/presentation/password_change/components/set_new_password_button.dart';

class SetNewPasswordPage extends StatefulWidget {
  final Map<String, dynamic> data;
  const SetNewPasswordPage({super.key, required this.data});

  @override
  State<SetNewPasswordPage> createState() => _SetNewPasswordPageState();
}

class _SetNewPasswordPageState extends State<SetNewPasswordPage> {
  final _newPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(children: [
          const Spacer(
            flex: 7,
          ),
          Text(
            "Write new password".tr(),
            style: const Font().s30,
          ),
          const Spacer(
            flex: 10,
          ),
          NewPasswordTextField(newPasswordController: _newPasswordController),
          const Spacer(
            flex: 18,
          ),
          SetNewPasswordButton(
              widget: widget, newPasswordController: _newPasswordController),
          const Spacer(
            flex: 4,
          ),
        ]),
      ),
    );
  }
}
