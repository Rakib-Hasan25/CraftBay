import 'package:ecommerce/presentation/ui/utlis/color_palette.dart';
import 'package:ecommerce/presentation/ui/widgets/catagoryCard.dart';
import 'package:flutter/material.dart';

class CatagoryListScreen extends StatefulWidget {
  const CatagoryListScreen({super.key});

  @override
  State<CatagoryListScreen> createState() => _CatagoryListScreenState();
}

class _CatagoryListScreenState extends State<CatagoryListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorPalette.primaryColor,
        elevation: 0,
        leading: const BackButton(color: Colors.black,
        ),
        title: const Text("Catagory",style: TextStyle(color: Colors.black),),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16
        ), itemBuilder: (context,index){
          return FittedBox(child: const CatagoryCard());
        }),
      ),
    );
  }
}

