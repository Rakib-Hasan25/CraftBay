import 'package:ecommerce/presentation/ui/screens/auth/otp_verification_screen.dart';
import 'package:ecommerce/presentation/ui/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utlis/image_assets.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});

  @override
  State<CompleteProfileScreen> createState() =>
      _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
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
                  height: 20,
                ),
                Center(
                    child: Image.asset(
                  ImageAssets.craftyBayLogoPNG,
                )),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  'Complete Profile',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontSize: 24),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Get started with us with your details',
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
                    hintText: 'First Name'
                  ),

                ),
                const SizedBox(
                  height:12 ,
                ),
                TextFormField(
                  //validation er bepar ase tai
                  decoration: InputDecoration(
                      hintText: 'Last Name'
                  ),

                ),
                const SizedBox(
                  height:12 ,
                ),
                TextFormField(
                  //validation er bepar ase tai
                  decoration: InputDecoration(
                      hintText: 'Mobile'
                  ),

                ),
                const SizedBox(
                  height:12 ,
                ),
                TextFormField(
                  //validation er bepar ase tai
                  decoration: InputDecoration(
                      hintText: 'City'
                  ),

                ),
                const SizedBox(
                  height:12 ,
                ),
                TextFormField(
                  //validation er bepar ase tai
                  maxLines: 6,

                  decoration: InputDecoration(
                      hintText: 'Shipping Address',
                      contentPadding: EdgeInsets.symmetric(horizontal: 16,vertical: 16)
                  ),

                ),

                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {
                          Get.to(HomeScreen());
                        }, child: Text('Complete')))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
