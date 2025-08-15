import 'package:apollo_mobile/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:apollo_mobile/features/auth/presentation/widgets/otp_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is SignInFailure) {
            _showErrorSnackbar(context, state.message);
          }
        },
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: OtpForm(),
        ),
      ),
    );
  }

  void _showErrorSnackbar(BuildContext context, String message) {
    try {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (Get.isSnackbarOpen) Get.closeCurrentSnackbar();
        Get.snackbar(
          'Error',
          message,
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 3),
        );
      });
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(message), backgroundColor: Colors.red),
        );
      }
    }
  }
}
