import 'package:flutter/material.dart';

import '../utlis/color_palette.dart';

class CatagoryCard extends StatelessWidget {
  const CatagoryCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Container(
            margin:EdgeInsets.symmetric(horizontal: 8),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: ColorPalette.primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(Icons.shop,size: 40,color: ColorPalette.primaryColor,),
          ),
          SizedBox(height: 8,),
          Text('Electronics',style: TextStyle(
              fontSize: 15,
              color: ColorPalette.primaryColor,
              letterSpacing: 0.4
          ),),
        ],
      ),
    );
  }
}