import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hosy/core/const/colors.dart';
import 'package:hosy/core/const/text_constants.dart';
import 'package:hosy/screens/forgot_password/bloc/forgot_password_bloc.dart';
import 'package:hosy/screens/forgot_password/widget/forgot_password_content.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          TextConstants.passwordReset,
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        iconTheme:
            const IconThemeData(color: AppColors.buttonColor),
      ),
      body: _buildContext(context),
    );
  }

  BlocProvider<ForgotPasswordBloc> _buildContext(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ForgotPasswordBloc(),
      child: BlocConsumer<ForgotPasswordBloc, ForgotPasswordState>(
        buildWhen: (_, currState) => currState is ForgotPasswordInitial,
        builder: (context, state) {
          return const ForgotPasswordContent();
        },
        listenWhen: (_, currState) =>
            currState is ForgotPasswordError ||
            currState is ForgotPasswordSuccess,
        listener: (context, state) {
          if (state is ForgotPasswordSuccess) {
            forgotPasswordSuccessfullySent(context);
          }
          if (state is ForgotPasswordError) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
      ),
    );
  }

  Future<void> forgotPasswordSuccessfullySent(BuildContext context) async {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text(TextConstants.resetPasswordLinkWasSent),
      duration: Duration(seconds: 2),
    ));
    await Future.delayed(const Duration(seconds: 2));
    // ignore: use_build_context_synchronously
    Navigator.pop(context);
  }
}