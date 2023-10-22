import 'package:flutter/material.dart';

import '../../../data/model/CategoryListData.dart';
import '../utlis/color_palette.dart';

class CatagoryCard extends StatelessWidget {
  CategoryListData categoryData;
  final VoidCallback onTap;
   CatagoryCard({
    super.key,required this.categoryData,
     required this.onTap
  });


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Container(
              height: 60,
              width: 60,
              margin:EdgeInsets.symmetric(horizontal: 8),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: ColorPalette.primaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Image.network(categoryData.categoryImg??'',height: 50),
            ),
            SizedBox(height: 8,),
            Text(categoryData.categoryName ?? '',style: TextStyle(
                fontSize: 15,
                color: ColorPalette.primaryColor,
                letterSpacing: 0.4
            ),),
          ],
        ),
      ),
    );
  }
}