import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pod_i_ya/core/style/text_styles.dart';
import 'package:pod_i_ya/features/logging/presentation/email_approve/components/email_approve_button.dart';
import 'package:pod_i_ya/features/logging/presentation/entering_pages/components/common/code_text_field.dart';

class EmailApprovePage extends StatefulWidget {
  final Map<String, dynamic> data;
  const EmailApprovePage({super.key, required this.data});

  @override
  State<EmailApprovePage> createState() => _EmailApprovePageState();
}

class _EmailApprovePageState extends State<EmailApprovePage> {
  final _codeController = TextEditingController();


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
            "Email approve".tr(),
            style: const Font().s30,
          ),
          const Spacer(
            flex: 6,
          ),
          CodeTextField(codeController: _codeController),
          const Spacer(
            flex: 2,
          ),
          const Spacer(
            flex: 18,
          ),
          EmailApproveButton(widget: widget, codeController: _codeController),
          const Spacer(
            flex: 4,
          ),
        ]),
      ),
    );
  }
}



