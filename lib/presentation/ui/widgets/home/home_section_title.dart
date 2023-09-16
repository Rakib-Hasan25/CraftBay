import 'package:flutter/material.dart';


class HomeSectionTitle extends StatelessWidget {
  const HomeSectionTitle({
    super.key,required this.title,
    required this.onTap});
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),),
        TextButton(onPressed: (){}, child: Text('See All')),
      ],
    );
  }
}