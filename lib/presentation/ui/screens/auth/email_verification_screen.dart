import 'package:ecommerce/presentation/ui/screens/auth/otp_verification_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utlis/image_assets.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
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
                  'Welcome back',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontSize: 24),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'plese enter your email address',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(color: Colors.grey),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  //validation er bepar ase tai
                  decoration: InputDecoration(
                    hintText: 'Email'
                  ),

                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {
                          Get.to(OTPVerificationScreen());
                        }, child: Text('Next')))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
