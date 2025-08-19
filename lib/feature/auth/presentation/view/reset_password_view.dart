import 'package:flutter/material.dart';
import 'package:preisslerslunch/core/common/widgets/custom_botton.dart';
import 'package:preisslerslunch/core/common/widgets/custom_text_field.dart';

import '../../../../core/common/common_text.dart';

class ResetPasswordScreen extends StatelessWidget {
   ResetPasswordScreen({super.key});
final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            appName,
            const SizedBox(height: 150),
            const Text(
              'Reset password',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Enter your email to receive the OTP',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 30),
            CustomTextField(controller: emailController, hintText: "Enter your email", prefixIcon: Icons.email_outlined),
            const SizedBox(height: 30),
      CustomButton(text: 'Send OTP', onPressed: (){}),
            const SizedBox(height: 40),
            const Text(
              'Your Profile helps us customize your experience',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 200),
            Text('Your data is secure and private'),
          ],
        ),
      ),
    );
  }
}