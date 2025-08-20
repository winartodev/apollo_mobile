import 'package:apollo_mobile/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:apollo_mobile/features/auth/presentation/widgets/sign_up_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is SignUpFailure) {
            _showErrorSnackbar(context, state.message);
          } else if (state is SignUpSuccess) {
            Get.toNamed(state.response.redirectionLink);
          }
        },
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: SignUpForm(),
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
