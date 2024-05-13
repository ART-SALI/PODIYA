import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pod_i_ya/core/style/text_styles.dart';
import 'package:pod_i_ya/features/logging/data/datasource/_datasource.dart';
import 'package:pod_i_ya/features/logging/presentation/password_change/set_new_password.dart';
import 'package:pod_i_ya/features/main_app/data/datasource/user_datasourse.dart';
import 'package:pod_i_ya/features/main_app/presentation/cubit/user_cubit.dart';
import 'package:pod_i_ya/features/main_app/presentation/main_app.dart';

class SetNewPasswordButton extends StatelessWidget {
  const SetNewPasswordButton({
    super.key,
    required this.widget,
    required TextEditingController newPasswordController,
  }) : _newPasswordController = newPasswordController;

  final SetNewPasswordPage widget;
  final TextEditingController _newPasswordController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, String>(
      builder: (context, value) {
        return SizedBox(
          width: 320,
          height: 56,
          child: TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                  Theme.of(context).colorScheme.primary),
            ),
            onPressed: () async {
              Map<String, dynamic> data = {};
              data["email"] = widget.data["email"];
              data["new_password"] = _newPasswordController.text;
              var datasource = DatasourceImpl(dio: Dio());
              if (await datasource.postSetNewPassword(data)) {
                Map<String, dynamic> newData = {};
                newData["email"] = data["email"];
                newData["password"] = data["new_password"];
                if (await datasource.postUserLogin(newData)) {
                  BlocProvider.of<UserCubit>(context)
                      .toggleToken(value: datasource.userModel!.token!);
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const MainAppScreen()));
                }
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
      },
    );
  }
}
