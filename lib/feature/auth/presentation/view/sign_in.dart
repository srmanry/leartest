import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../core/common/common_text.dart';
import '../../../../core/common/widgets/custom_botton.dart';
import '../../../../core/common/widgets/custom_text_field.dart';
import '../controller/auth_controller.dart';
import '../widget/remember_me.dart';
import 'sign_up_view.dart';

class SignInScreen extends StatelessWidget {
  final AuthController controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 150,),
                /// Upper Part (Login Form)
                appName,
                const SizedBox(height: 20),
                const Text(
                  "Log In Your Account",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 20),
            
                CustomTextField(
                  controller: controller.emailController,
                  hintText: "Enter your email",
                  prefixIcon: Icons.email,
                ),
                const SizedBox(height: 15),
            
                CustomTextField(
                  controller: controller.passwordController,
                  hintText: "Enter your password",
                  prefixIcon: Icons.lock,
                  isPassword: true,
                ),
                RememberForgotRow(),
                const SizedBox(height: 20),
            
                Obx(() => controller.isLoading.value
                    ? const CircularProgressIndicator()
                    : CustomButton(
                  text: "Sign In",
                  onPressed: controller.login,
                )),
                const SizedBox(height: 20),
            
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("New to our platform? "),
                    GestureDetector(
                      onTap: () => Get.to(() => SignupScreen()),
                      child: const Text(
                        "Sign Up Here",
                        style: TextStyle(color: Colors.blue),
                      ),
                    )
                  ],
                ),
            
            
                /// Bottom text (always at bottom)
                SizedBox(height: 200,),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(
                      "Your Profile helps us customize your experience",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: Color(0xFF6B6B6B),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
