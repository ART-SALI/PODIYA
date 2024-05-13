import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pod_i_ya/core/style/text_styles.dart';

import '../../../../data/datasource/_datasource.dart';
import '../../../email_approve/email_approve.dart';

class RegistrationEnterButton extends StatelessWidget {
  const RegistrationEnterButton({
    super.key,
    required TextEditingController userNameController,
    required TextEditingController passwordController,
    required TextEditingController emailController,
  })  : _userNameController = userNameController,
        _passwordController = passwordController,
        _emailController = emailController;

  final TextEditingController _userNameController;
  final TextEditingController _passwordController;
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
          data["username"] = _userNameController.text;
          data["password"] = _passwordController.text;
          data["email"] = _emailController.text;
          var datasource = DatasourceImpl(dio: Dio());
          // var rep = RepositoryImpl(datasource: datasource);
          if (await datasource.postVerefiNewUserSend(data)) {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => EmailApprovePage(data: data)));
          }
        },
        child: Text(
          "Enter".tr(),
          style: Font()
              .s20
              .copyWith(color: Theme.of(context).colorScheme.onPrimary),
        ),
      ),
    );
  }
}
