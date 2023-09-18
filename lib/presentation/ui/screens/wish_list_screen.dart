import 'package:ecommerce/presentation/ui/utlis/color_palette.dart';
import 'package:ecommerce/presentation/ui/widgets/home/ProductCard.dart';
import 'package:flutter/material.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorPalette.primaryColor,
        elevation: 0,
        leading: const BackButton(color: Colors.black,
        ),
        title: const Text("Product",style: TextStyle(color: Colors.black),),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16
        ), itemBuilder: (context,index){
          return FittedBox(child: ProductCard());
        }),
      ),
    );
  }
}

