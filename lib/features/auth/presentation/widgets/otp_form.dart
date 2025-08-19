import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OtpForm extends StatefulWidget {
  const OtpForm({super.key});

  @override
  State<OtpForm> createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  final List<TextEditingController> _otpControllers = List.generate(
    6,
    (index) => TextEditingController(),
  );

  final List<FocusNode> _otpFocusNodes = List.generate(
    6,
    (index) => FocusNode(),
  );

  final _formKey = GlobalKey<FormState>();

  int _resendTimeout = 30;
  late Timer _timer;
  bool _canResend = false;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    for (final otpController in _otpControllers) {
      otpController.dispose();
    }

    for (final otpFocusNodes in _otpFocusNodes) {
      otpFocusNodes.dispose();
    }

    _timer.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 40),
          const Text(
            "Verifikasi OTP",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 5),
          const Text(
            "Enter the OTP sent to your email to\nverify your identity and continue securely",
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              6,
              (index) => SizedBox(
                width: 45,
                child: TextField(
                  controller: _otpControllers[index],
                  focusNode: _otpFocusNodes[index],
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  maxLength: 1,
                  decoration: InputDecoration(
                    counterText: '',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  onChanged: (value) => _moveToNextField(value, index),
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: _canResend
                ? TextButton(
                    onPressed: _resendOTP,
                    child: const Text('Resend Code'),
                  )
                : Text(
                    '($_resendTimeout)',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
          ),
        ],
      ),
    );
  }

  void _resendOTP() {
    debugPrint("resend OTP");
    _startTimer();
  }

  void _submitOtp() {
    debugPrint("submit OTP");
  }

  void _startTimer() {
    setState(() {
      _canResend = false;
      _resendTimeout = 30;
    });

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_resendTimeout > 0) {
        setState(() {
          _resendTimeout--;
        });
      } else {
        setState(() {
          _canResend = true;
        });
        timer.cancel();
      }
    });
  }

  void _moveToNextField(String value, int index) {
    if (index < 0 && index >= _otpFocusNodes.length) {
      return;
    }

    if (value.isNotEmpty && index < _otpFocusNodes.length - 1) {
      _otpFocusNodes[index].unfocus();
      FocusScope.of(context).requestFocus(_otpFocusNodes[index + 1]);
    } else if (value.isEmpty && index > 0) {
      _otpFocusNodes[index].unfocus();
      FocusScope.of(context).requestFocus(_otpFocusNodes[index - 1]);

      if (_otpControllers[index - 1].text.isNotEmpty) {
        _otpControllers[index - 1].clear();
      }
    }

    if (index == 5 && value.isNotEmpty) {
      _submitOtp();
    }
  }
}
