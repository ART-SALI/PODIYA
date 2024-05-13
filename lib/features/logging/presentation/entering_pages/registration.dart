import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pod_i_ya/core/style/text_styles.dart';
import 'package:pod_i_ya/features/logging/presentation/entering_pages/components/common/email_text_field.dart';
import 'package:pod_i_ya/features/logging/presentation/entering_pages/components/common/password_text_field.dart';
import 'package:pod_i_ya/features/logging/presentation/entering_pages/components/common/restore_password.dart';
import 'package:pod_i_ya/features/logging/presentation/entering_pages/components/common/user_name_text_field.dart';
import 'package:pod_i_ya/features/logging/presentation/entering_pages/components/registration/registration_enter_button.dart';

import 'components/registration/asking_about_account.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage>{

  final _userNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(children: [
          const Spacer(
            flex: 14,
          ),
          Text(
            "Registration".tr(),
            style: const Font().s30,
          ),
          const Spacer(
            flex: 6,
          ),
          UserNameTextField(userNameController: _userNameController,),
          const Spacer(
            flex: 2,
          ),
          EmailTextField(emailController: _emailController),
          const Spacer(
            flex: 2,
          ),
          PasswordTextField(passwordController: _passwordController),
          const Spacer(
            flex: 4,
          ),
          const RestorePassword(),
          const Spacer(
            flex: 18,
          ),
          const AskingAboutAccount(),
          const Spacer(
            flex: 3,
          ),
          RegistrationEnterButton(userNameController: _userNameController, passwordController: _passwordController, emailController: _emailController),
          const Spacer(
            flex: 4,
          ),
        ]),
      ),
    );
  }
}



