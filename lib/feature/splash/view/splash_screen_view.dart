import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:preisslerslunch/feature/auth/presentation/view/sign_in.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 6), () {
      Get.off(() =>  SignInScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Splash background color
      body: Center(
        child: Text("Preissler's Lunch",style: TextStyle(fontSize: 28,fontWeight: FontWeight.w500),)
      ),
    );
  }
}
