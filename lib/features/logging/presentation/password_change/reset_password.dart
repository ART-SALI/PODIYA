import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pod_i_ya/core/style/text_styles.dart';
import 'package:pod_i_ya/features/logging/presentation/entering_pages/components/common/email_text_field.dart';
import 'package:pod_i_ya/features/logging/presentation/password_change/components/reset_password_button.dart';

class RestorePasswordPage extends StatefulWidget {
  const RestorePasswordPage({super.key});

  @override
  State<RestorePasswordPage> createState() => _RestorePasswordPageState();
}

class _RestorePasswordPageState extends State<RestorePasswordPage> {
  final _emailController = TextEditingController();


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
            "Reset password".tr(),
            style: const Font().s30,
          ),
          const Spacer(
            flex: 10,
          ),
          EmailTextField(emailController: _emailController),
          const Spacer(
            flex: 2,
          ),
          const Spacer(
            flex: 18,
          ),
          ResetPasswordButton(emailController: _emailController),
          const Spacer(
            flex: 4,
          ),
        ]),
      ),
    );
  }
}



