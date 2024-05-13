import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pod_i_ya/core/style/text_styles.dart';
import 'package:pod_i_ya/features/logging/data/datasource/_datasource.dart';
import 'package:pod_i_ya/features/logging/presentation/password_change/password_change_validate.dart';

class ResetPasswordButton extends StatelessWidget {
  const ResetPasswordButton({
    super.key,
    required TextEditingController emailController,
  }) : _emailController = emailController;

  final TextEditingController _emailController;

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
          data["email"] = _emailController.text;
          var datasource = DatasourceImpl(dio: Dio());
          // var rep = RepositoryImpl(datasource: datasource);
          if (await datasource.postResetPassword(data)) {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ResetPasswordValidatePage(data: data)));
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
