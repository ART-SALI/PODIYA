import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pod_i_ya/core/style/text_styles.dart';
import 'package:pod_i_ya/features/logging/data/datasource/_datasource.dart';
import 'package:pod_i_ya/features/logging/presentation/password_change/password_change_validate.dart';
import 'package:pod_i_ya/features/logging/presentation/password_change/set_new_password.dart';

class PasswordChangeValidateButton extends StatelessWidget {
  const PasswordChangeValidateButton({
    super.key,
    required this.widget,
    required TextEditingController codeController,
  }) : _codeController = codeController;

  final ResetPasswordValidatePage widget;
  final TextEditingController _codeController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320,
      height: 56,
      child: TextButton(
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all(Theme.of(context).colorScheme.primary),
        ),
        onPressed: () async {
          Map<String, dynamic> data = {};
          data["email"] = widget.data["email"];
          data["code"] = _codeController.text;
          var datasource = DatasourceImpl(dio: Dio());
          // var rep = RepositoryImpl(datasource: datasource);
          if (await datasource.postVerefiNewUser(data, widget.data)) {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => SetNewPasswordPage(data: data)));
          }
        },
        child: Text(
          "Enter".tr(),
          style: const Font()
              .s20
              .copyWith(color: Theme.of(context).colorScheme.onPrimary),
        ),
      ),
    );
  }
}
