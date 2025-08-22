import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:preisslerslunch/feature/auth/presentation/view/set_reset_password.dart';
import '../../../../core/common/common_text.dart';
import '../../../../core/common/widgets/custom_botton.dart';

class OtpCodeScreenView extends StatelessWidget {
  OtpCodeScreenView({super.key});
  final otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // PIN theme for rounded filled boxes
    final defaultPinTheme = PinTheme(
      width: 60,
      height: 60,
      textStyle: const TextStyle(
        fontSize: 20,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      decoration: BoxDecoration(
        color: Colors.grey[200],//
          
        // filled color
        borderRadius: BorderRadius.circular(6), // rounded corners
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child:LayoutBuilder(builder: (context, constraints) {
          return
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight,
                  ),
                 child: IntrinsicHeight(
                    child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      appName,
                      const SizedBox(height: 80),
                      const Text(
                        'Enter OTP',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Enter your received OTP',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                      const SizedBox(height: 30),

                      // Rounded filled OTP input
                      Pinput(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        autofocus: true,
                        length: 5,
                        controller: otpController,
                        defaultPinTheme: defaultPinTheme,
                        onCompleted: (pin) {
                          print("Entered OTP: $pin");
                        },
                      ),     Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Didn't Receive OTP? ",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400),),
                            GestureDetector(
                              onTap: (){},
                              child: const Text(
                                "RESEND OTP",
                                style: TextStyle(color: Color(0xFF00C49A,),fontSize: 14,fontWeight: FontWeight.w400),
                              ),
                            )
                          ],
                        ),
                      ),


                      CustomActionButton(
                        idleText: "Send OTP",
                        loadingText: "OTP Sending...",
                        doneText: "Done",
                        errorText: "Failed! Try Again",
                        onAction: (controller) async {
                          try {
                            // Example API call
                            await Future.delayed(const Duration(seconds: 2));
                            bool success = true; // API response

                            if (success) {
                              controller.setDone();
                              Get.to(()=>SetResetPasswordView());
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
                      SizedBox(height: 100,),
                     // Spacer(),
                      BottonText()
                    ],
                  ),

                ),
              ),
            )

                 );}


    ),
    )
    );


  }
}
