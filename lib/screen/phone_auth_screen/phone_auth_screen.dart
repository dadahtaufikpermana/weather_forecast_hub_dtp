import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:weather_forecast_hub_dtp/data/service/auth_service.dart';
import 'package:weather_forecast_hub_dtp/extensions/context_extensions.dart';

import '../../routes/routes.dart';

class PhoneAuthScreen extends StatefulWidget {
  const PhoneAuthScreen({super.key});

  @override
  _PhoneAuthScreenState createState() => _PhoneAuthScreenState();
}

class _PhoneAuthScreenState extends State<PhoneAuthScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late TextEditingController _phoneNumberController;
  late TextEditingController _otpController;
  String _verificationId = '';

  @override
  void initState() {
    super.initState();
    _phoneNumberController = TextEditingController();
    _otpController = TextEditingController();
  }

  @override
  void dispose() {
    _phoneNumberController.dispose();
    _otpController.dispose();
    super.dispose();
  }

  void _onPressSendOTP() async {
    String phoneNumber = '+${_phoneNumberController.text.trim()}';

    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        timeout: const Duration(seconds: 60),
        verificationCompleted: _onVerificationCompleted,
        verificationFailed: _onVerificationFailed,
        codeSent: _onCodeSent,
        codeAutoRetrievalTimeout: _onCodeAutoRetrievalTimeout,
      );
    } catch (e) {
      print('Error: $e');
    }
  }

  void _onVerificationCompleted(PhoneAuthCredential credential) {}

  void _onVerificationFailed(FirebaseAuthException e) {
    print('Verification Failed: $e');
  }

  void _onCodeSent(String verificationId, int? resendToken) {
    setState(() {
      _verificationId = verificationId;
    });
    print('Code Sent: $verificationId');
  }

  void _onCodeAutoRetrievalTimeout(String verificationId) {
    setState(() {
      _verificationId = verificationId;
    });
  }

  void _onPressVerifyOTP() async {
    String otp = _otpController.text;
    final authservice = AuthService();

    try {
      await authservice.verifyCode(_verificationId, otp);
      context.showCustomFlashMessage(
        status: 'success',
        title: 'Login Success!',
        positionBottom: false,
      );

      Navigator.pushNamed(context, Routes.homeScreen).then((_) {});
      print('Verification Successful!');
    } catch (e) {
      if (e is FirebaseAuthException && e.code == 'invalid-verification-code') {
        // Handle specifically for invalid verification code
        context.showCustomFlashMessage(
          status: 'error',
          title: 'Invalid Verification Code!',
          positionBottom: false,
        );
      } else {
        // Handle other errors
        context.showCustomFlashMessage(
          status: 'error',
          title: 'Login Failed!',
          positionBottom: false,
        );
      }
      print('Error: $e');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Phone Authentication'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _phoneNumberController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'Phone Number',
                hintText: '628XXXXXX',
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _onPressSendOTP,
              child: Text('Send OTP'),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _otpController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'OTP',
                hintText: 'Enter OTP',
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _onPressVerifyOTP,
              child: Text('Verify OTP'),
            ),
          ],
        ),
      ),
    );
  }
}
