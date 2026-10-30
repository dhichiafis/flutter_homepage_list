import 'package:flutter/material.dart';

class ReusableText extends StatelessWidget {
  const ReusableText({super.key,
  
  required this.text,
  required this.fweight,
  required this.textColor,
  required this.size
  });
  final String text;
  final FontWeight fweight;
  final Color textColor;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Text(text,style: TextStyle(fontWeight: fweight,color: textColor,fontSize: size),);
  }
}