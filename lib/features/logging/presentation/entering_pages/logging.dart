import 'package:flutter/material.dart';
import 'package:pod_i_ya/features/logging/presentation/entering_pages/components/common/restore_password.dart';
import 'package:pod_i_ya/features/logging/presentation/entering_pages/components/logging/asking_about_account.dart';
import 'package:pod_i_ya/features/logging/presentation/entering_pages/components/common/email_text_field.dart';
import 'package:pod_i_ya/features/logging/presentation/entering_pages/components/logging/enter_button_logging.dart';
import 'package:pod_i_ya/features/logging/presentation/entering_pages/components/common/password_text_field.dart';
import 'package:pod_i_ya/features/logging/presentation/entering_pages/components/logging/title_text.dart';


class LoggingPage extends StatefulWidget {
  const LoggingPage({super.key});

  @override
  State<LoggingPage> createState() => _LoggingPageState();
}

class _LoggingPageState extends State<LoggingPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(children: [
          const Spacer(
            flex: 28,
          ),
          const TitleText(),
          const Spacer(
            flex: 16,
          ),
          EmailTextField(emailController: _emailController),
          const Spacer(
            flex: 6,
          ),
          PasswordTextField(passwordController: _passwordController),
          const Spacer(
            flex: 6,
          ),
          const RestorePassword(),
          const Spacer(
            flex: 42,
          ),
          const AskingAboutAccount(),
          const Spacer(
            flex: 10,
          ),
          EnterButtonLogging(
              passwordController: _passwordController,
              emailController: _emailController),
          const Spacer(
            flex: 14,
          ),
        ]),
      ),
    );
  }
}












