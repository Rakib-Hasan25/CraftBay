import 'package:ecommerce/presentation/state_holders/email_verification_controller.dart';
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
  final TextEditingController _emailController = TextEditingController();
   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
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
                      controller: _emailController,
                      decoration: const InputDecoration(hintText: 'Email'),
                      validator: (String? text) {
                        if (text?.isEmpty ?? true) {
                          return "Enter Email Address";
                        } else if (text!.isEmail == false) {
                          return 'Enter a Valid Email Adress';
                        }
                        return null;
                      }),
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: GetBuilder<EmailVerificationController>(

                      builder: (controller) {
                        if (controller.emailVerificationInprocess) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        return ElevatedButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                      verifyEmail(controller);

                              }
                            },
                            child: Text('Next'));
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  Future<void> verifyEmail(EmailVerificationController controller)async{
    final response = await controller
        .verifyEmail(_emailController.text.trim());
    if (response) {
      Get.to( OTPVerificationScreen(email:_emailController.text.trim()));
    } else {
      if(mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
           SnackBar(
            content: Text(
                controller.message),
          ),
        );
      }
    }

  }
}
