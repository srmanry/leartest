import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:preisslerslunch/feature/app_ground.dart';

import '../../../../core/common/common_text.dart';
import '../../../../core/common/widgets/custom_botton.dart';
import '../../../../core/common/widgets/custom_text_field.dart';
import '../controller/auth_controller.dart';
import '../widget/remember_me.dart';
import 'sign_up_view.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  final AuthController controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: IntrinsicHeight(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 80),

                        // App Name / Logo
                        appName,
                        const SizedBox(height: 40),

                        // Title
                        const Text(
                          "Log In to Your Account",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Email Field
                        CustomTextField(
                          controller: controller.emailController,
                          hintText: "Enter your email",
                          prefixIcon: Icons.email_outlined,
                        ),
                        const SizedBox(height: 15),

                        // Password Field
                        CustomTextField(
                          controller: controller.passwordController,
                          hintText: "Enter your password",
                          prefixIcon: Icons.lock_outlined,
                          suffixIcon: Icons.visibility,
                          isPassword: true,
                        ),
                        const SizedBox(height: 10),

                        // Remember me / Forgot password row
                        const RememberForgotRow(),
                        const SizedBox(height: 25),

                        // Log In Button
                        CustomActionButton(
                          idleText: "Log In",
                          loadingText: "Logging in...",
                          doneText: "Welcome!",
                          errorText: "Failed! Try Again",
                          onAction: (btnController) async {
                            try {
                              // Example: API call
                              await Future.delayed(
                                  const Duration(seconds: 2));
                              bool success = true; // API response

                              if (success) {
                                btnController.setDone();
                                Get.to(() => AppGroundView());
                              } else {
                                btnController.setError();
                              }
                            } catch (_) {
                              btnController.setError();
                            }

                            // Auto reset after 2 seconds
                            await Future.delayed(const Duration(seconds: 2));
                            btnController.setIdle();
                          },
                          onDone: () async {
                            print("Navigate to Dashboard");
                          },
                        ),
                        const SizedBox(height: 20),

                        // Sign Up Link
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
                            ),
                          ],
                        ),


                       Spacer(),
                        Align(alignment: Alignment.bottomCenter,

                        child: BottonText())
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),

    );

  }
}
