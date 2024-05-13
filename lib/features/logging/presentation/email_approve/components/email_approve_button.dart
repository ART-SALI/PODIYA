import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pod_i_ya/features/logging/data/datasource/_datasource.dart';
import 'package:pod_i_ya/features/logging/presentation/email_approve/email_approve.dart';
import 'package:pod_i_ya/features/main_app/presentation/cubit/user_cubit.dart';
import 'package:pod_i_ya/features/main_app/presentation/main_app.dart';

import '../../../../../core/style/text_styles.dart';

class EmailApproveButton extends StatelessWidget {
  const EmailApproveButton({
    super.key,
    required this.widget,
    required TextEditingController codeController,
  }) : _codeController = codeController;

  final EmailApprovePage widget;
  final TextEditingController _codeController;

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
              data["code"] = _codeController.text;
              var datasource = DatasourceImpl(dio: Dio());
              // var rep = RepositoryImpl(datasource: datasource);
              if (await datasource.postVerefiNewUser(data, widget.data)) {
                Map<String, dynamic> newData = {};
                newData["email"] = widget.data["email"];
                newData["password"] = widget.data["password"];
                if (await datasource.postUserLogin(newData)) {
                  BlocProvider.of<UserCubit>(context)
                      .toggleToken(value: datasource.userModel!.token!);
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => MainAppScreen()));
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
