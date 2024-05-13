import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pod_i_ya/core/style/text_styles.dart';
import 'package:pod_i_ya/features/main_app/presentation/cubit/user_cubit.dart';
import 'package:pod_i_ya/features/main_app/presentation/main_app.dart';

import '../../../../data/datasource/_datasource.dart';

class EnterButtonLogging extends StatelessWidget {
  const EnterButtonLogging({
    super.key,
    required TextEditingController passwordController,
    required TextEditingController emailController,
  })  : _passwordController = passwordController,
        _emailController = emailController;

  final TextEditingController _passwordController;
  final TextEditingController _emailController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, String>(builder: (context, value) {
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
          data["password"] = _passwordController.text;
          data["email"] = _emailController.text;
          var datasource = DatasourceImpl(dio: Dio());
          // var rep = RepositoryImpl(datasource: datasource);
          if (await datasource.postUserLogin(data)) {
            BlocProvider.of<UserCubit>(context)
                .toggleToken(value: datasource.token!);
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const MainAppScreen()));
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
    },);
  }
}
