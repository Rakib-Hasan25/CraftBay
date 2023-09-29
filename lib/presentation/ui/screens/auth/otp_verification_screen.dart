import 'package:ecommerce/presentation/state_holders/otp_verification_controller.dart';
import 'package:ecommerce/presentation/ui/screens/auth/complete_profile_screen.dart';
import 'package:ecommerce/presentation/ui/screens/main_bottom_nav_screen.dart';
import 'package:ecommerce/presentation/ui/utlis/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../utlis/image_assets.dart';

class OTPVerificationScreen extends StatefulWidget {
  const OTPVerificationScreen({super.key,required this.email});
  final String email;

  @override
  State<OTPVerificationScreen> createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  final TextEditingController otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 100,
                ),
                Center(
                    child: Image.asset(
                  ImageAssets.craftyBayLogoPNG,
                )),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  'Enter your OTP Code',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontSize: 24),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'A 4 digit OTP code has been sent',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(color: Colors.grey),
                ),
                const SizedBox(
                  height: 16,
                ),

                PinCodeTextField(
                  controller: otpController,
                  length: 4,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  keyboardType: TextInputType.number,

                  pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: 50,
                      fieldWidth: 50,
                      activeFillColor: Colors.white,
                      inactiveFillColor: Colors.white,
                      selectedFillColor: Colors.white,
                      activeColor: ColorPalette.primaryColor,
                      inactiveColor: ColorPalette.primaryColor,
                      selectedColor: Colors.green),
                  animationDuration: Duration(milliseconds: 300),
                  enableActiveFill: true,
                  onCompleted: (v) {},
                  onChanged: (value) {},
                  beforeTextPaste: (text) {
                    return true;
                  },
                  appContext: context,
                ),

                // TextFormField(
                //     //validation er bepar ase tai
                //     ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  width: double.infinity,
                  child: GetBuilder<OtpVerificationController>(

                    builder: (controller) {

                      if(controller.OtpVerificationInprocess){
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      return ElevatedButton(
                        onPressed: () {
                          verifyOtp(controller);
                        },
                        child: Text('Next'),
                      );
                    }
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),

                // every text can be divided into smaller span
                // it helf to manage every text

                RichText(
                    text: const TextSpan(
                        style: TextStyle(color: Colors.grey),
                        children: [
                      TextSpan(text: 'This code will expire in '),
                      TextSpan(
                        text: '120s',
                        style: TextStyle(
                          color: ColorPalette.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ])),
                TextButton(
                  onPressed: () {

                  },
                  child: const Text("Resend"),
                  style: TextButton.styleFrom(foregroundColor: Colors.grey),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> verifyOtp(OtpVerificationController controller)async{
    final response = await controller
        .verifyOtp(widget.email,otpController.text.trim());
    if (response) {
      Get.offAll(()=>const MainBottomNavScreen());
    } else {
      if(mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
                'Otp verification failed ! Try again'),
          ),
        );
      }
    }

  }


}
