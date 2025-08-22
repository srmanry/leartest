import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:preisslerslunch/feature/auth/presentation/view/sign_in.dart';
import 'package:preisslerslunch/feature/auth/presentation/widget/by_registation.dart';
import '../../../../core/common/common_text.dart';
import '../../../../core/common/widgets/custom_botton.dart';
import '../../../../core/common/widgets/custom_text_field.dart';
import '../../../../core/services/auth_services/auth_service.dart';
import '../../../app_ground.dart';
import '../controller/auth_controller.dart';

class SignupScreen extends StatelessWidget {
  final AuthController controller = Get.put(AuthController());

  final authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.red, // Status bar background
          statusBarIconBrightness: Brightness.light, // Android icons
          statusBarBrightness: Brightness.dark, // iOS icons
        ),
        automaticallyImplyLeading: false,toolbarHeight: 0,),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [ const Text(
            "Create Your Account",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [


                const SizedBox(height: 20),
                fieldName("Name"),
                CustomTextField(
                  controller: controller.nameController,
                  hintText: "Enter your Full Name",
                  prefixIcon: Icons.person_outline_outlined,
                ),
                const SizedBox(height: 15),
                fieldName("Company Name"),
                CustomTextField(
                  controller: controller.companyController,
                  hintText: "Enter your Company Name",
                  prefixIcon: Icons.business,
                ),
                const SizedBox(height: 15),
                fieldName("Email"),
                CustomTextField(
                  controller: controller.emailController,
                  hintText: "Enter your Email",
                  prefixIcon: Icons.email,
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 15),
                fieldName("Phone Number"),
                CustomTextField(
                  controller: controller.phoneController,
                  hintText: "Enter your Phone Number",
                  prefixIcon: Icons.phone,
                  keyboardType: TextInputType.phone,
                ),
                const SizedBox(height: 15),
                fieldName("Password"),
                CustomTextField(
                  controller: controller.passwordController,
                  hintText: "Create a Password",
                  prefixIcon: Icons.lock,
                  suffixIcon: Icons.visibility,
                  isPassword: true,
                ),
                const SizedBox(height: 15),
                fieldName("Confirm Password"),
                CustomTextField(
                  controller: controller.confirmPasswordController,
                  hintText: "Confirm Password",
                  prefixIcon: Icons.lock,
                  suffixIcon: Icons.visibility,
                  isPassword: true,
                ),
                const SizedBox(height: 8),
                ByRegistation(),
                CustomActionButton(
                  idleText: "Sign Up",
                  loadingText: "Signing up...",
                  doneText: "Welcome!",
                  errorText: "Failed! Try Again",
                  onAction: (controller) async {
                    try {
                      // Example: API call
                      await Future.delayed(const Duration(seconds: 2));


                      bool success = true; // API response

                      if (success) {
                        controller.setDone();
                        Get.to(()=>AppGroundView());
                      } else {
                        controller.setError();
                      }
                    } catch (_) {
                      controller.setError();
                    }

                    // Optional: auto reset after 2 seconds
                    await Future.delayed(const Duration(seconds: 8));
                    controller.setIdle();
                  },
                  onDone: () async {
                    print("Navigate to Dashboard");
                  },
                ),

                const SizedBox(height: 15),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account? "),
                    GestureDetector(
                      onTap: () => Get.to(() => SignInScreen()),
                      //onTap: () => Get.back(),
                      child: const Text(
                        "Sign In Here",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                ),

              ],
            ),
         SizedBox(height: 15,),
            Align(alignment: Alignment.bottomCenter,

                child: BottonText())
          ],
        ),
      ),
    );
  }
}
