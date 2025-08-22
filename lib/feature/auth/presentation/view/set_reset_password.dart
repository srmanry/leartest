import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:preisslerslunch/feature/auth/presentation/view/sign_in.dart';

import '../../../../core/common/common_text.dart';
import '../../../../core/common/widgets/custom_botton.dart';
import '../../../../core/common/widgets/custom_text_field.dart';

class SetResetPasswordView extends StatelessWidget {
   SetResetPasswordView({super.key});
  final newPasswordController = TextEditingController();
  final confrimPasswordController =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 80),
            appName,
            const SizedBox(height: 80),
            const Text('Reset password', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
            const SizedBox(height: 10),
            const Text(
              'Enter your email to receive the OTP',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 30),
            CustomTextField(
              controller: newPasswordController,
              hintText: "New Password",
              prefixIcon: Icons.email_outlined,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: CustomTextField(
                controller: confrimPasswordController,
                hintText: "Confirm Password",
                prefixIcon: Icons.email_outlined,
              ),
            ),
            //const SizedBox(height: 30),
            CustomActionButton(
              idleText: "Send OTP",
              loadingText: "OTP Send...",
              doneText: "Done",
              errorText: "Failed! Try Again",
              onAction: (controller) async {
                try {
                  // Example: API call
                  await Future.delayed(const Duration(seconds: 2));
                  bool success = true; // API response

                  if (success) {
                    controller.setDone();
                    Get.to(()=> SignInScreen());
                  } else {
                    controller.setError();
                  }
                } catch (_) {
                  controller.setError();
                }

                // Optional: auto reset after 2 seconds
                await Future.delayed(const Duration(seconds: 2));
                controller.setIdle();
              },
              onDone: () async {
                print("Navigate to Dashboard");
              },
            ),

            const SizedBox(height: 40),
            const Text(
              'Your Profile helps us customize your experience',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),


            BottonText()
          ],
        ),
      ),
    );
  }
}
