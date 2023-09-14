import 'package:ecommerce/presentation/ui/utlis/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../utlis/image_assets.dart';

class OTPVerificationScreen extends StatefulWidget {
  const OTPVerificationScreen({super.key});

  @override
  State<OTPVerificationScreen> createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
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
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('Next'),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),

                // every text can be divided into smaller span
                // it helf to manage every text

                RichText(
                    text: TextSpan(
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
                  onPressed: () {},
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
}
