import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:preisslerslunch/feature/auth/presentation/view/sign_in.dart';
import '../../../../core/common/common_text.dart';
import '../../../../core/common/widgets/custom_botton.dart';
import '../../../../core/common/widgets/custom_text_field.dart';
import '../controller/auth_controller.dart';

class SignupScreen extends StatelessWidget {
  final AuthController controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            const Text("Create Your Account", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            fieldName("Name"),
            CustomTextField(
              controller: controller.nameController,
              hintText: "Enter your Full Name",
              prefixIcon: Icons.person,
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
              isPassword: true,
            ),
            const SizedBox(height: 15),
            fieldName("Confirm Password"),
            CustomTextField(
              controller: controller.confirmPasswordController,
              hintText: "Confirm Password",
              prefixIcon: Icons.lock,
              isPassword: true,
            ),
            const SizedBox(height: 20),

            Obx(() => controller.isLoading.value
                ? const CircularProgressIndicator()
                : CustomButton(
              text: "Sign Up",
              onPressed: controller.signup,
            )),
            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Already have an account? "),
                GestureDetector(
                 onTap: ()=> Get.to(()=>SignInScreen()),
                  //onTap: () => Get.back(),
                  child: const Text("Sign In Here", style: TextStyle(color: Colors.blue)),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
