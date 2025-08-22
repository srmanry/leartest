import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../setting/presentation/view/about_screen.dart';
import '../../../setting/presentation/view/trems_condition_screen.dart';

import '../view/reset_password_view.dart';

class AuthController extends GetxController {
  var isLoading = false.obs;

  // Controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final nameController = TextEditingController();
  final companyController = TextEditingController();
  final phoneController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final rememberMe = false.obs;

  final otpController = TextEditingController();

  void toggleRemember(bool value) => rememberMe.value = value;

  void toggleRegister(bool value) => rememberMe.value = value;

  void forgotPassword() {
    Get.to(() => ResetPasswordScreen());
  }

  void termOfService() {
    Get.to(() =>TermsConditionsView ());
  }

  void privacyPolicy() {
    Get.to(() => AboutAppScreen());
  }

  final Dio dio = Dio(
    BaseOptions(
      baseUrl: "https://your-api-url.com/api/v1",
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );

  // Login function
  Future<void> login() async {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      Get.snackbar("Error", "Email & Password required");
      return;
    }

    try {
      isLoading.value = true;

      final response = await dio.post(
        "/auth/login",
        data: {
          "email": emailController.text,
          "password": passwordController.text,
        },
      );

      isLoading.value = false;

      if (response.statusCode == 200) {
        final token = response.data["token"];
        final role = response.data["user"]["role"];

        Get.snackbar("Success", "Login Successful ");

        // Role-based Navigation
        if (role == "user") {
          Get.offAllNamed("/userHome");
        } else if (role == "provider") {
          Get.offAllNamed("/providerHome");
        } else if (role == "admin") {
          Get.offAllNamed("/adminHome");
        }
      }
    } catch (e) {
      isLoading.value = false;
      Get.snackbar("Login Failed", e.toString());
    }
  }

  // Signup function
  Future<void> signup() async {
    if (passwordController.text != confirmPasswordController.text) {
      Get.snackbar("Error", "Passwords do not match");
      return;
    }

    try {
      isLoading.value = true;

      final response = await dio.post(
        "/auth/signup",
        data: {
          "name": nameController.text,
          "companyName": companyController.text,
          "email": emailController.text,
          "phone": phoneController.text,
          "password": passwordController.text,
        },
      );

      isLoading.value = false;

      if (response.statusCode == 201) {
        Get.snackbar("Success", "Account Created 🎉");
        Get.back(); // Login screen এ ফিরে যাও
      }
    } catch (e) {
      isLoading.value = false;
      Get.snackbar("Signup Failed", e.toString());
    }
  }
}
