import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/auth_controller.dart';


class RememberForgotRow extends StatelessWidget {
  const RememberForgotRow({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.find<AuthController>();
    return Row(

      children: [
        // Remember me (checkbox + label)
        Obx(() => Transform.scale(
          scale: 0.8,
          child: Checkbox(
            value: c.rememberMe.value,
            onChanged: (v) => c.toggleRemember(v ?? false),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(3),
            ),
          ),
        )),

        Expanded(child: Row(
       mainAxisAlignment: MainAxisAlignment.spaceBetween,
       children: [   const Text("Remember me"),

       // Forgot password
       TextButton(
         onPressed: c.forgotPassword,
         child: const Text("Forgot password?",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Color(0xFF00C49A)),),
       ),],))
      ],
    );
  }
}
