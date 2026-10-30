import 'package:flutter/material.dart';
import 'package:flutterlist/widget/reusabletext.dart';
class TapableItem extends StatelessWidget {
  const TapableItem({super.key,required this.text,required this.onTap});
  final String text;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 20,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          
        color: Colors.white,
          boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.15),
        blurRadius: 8,
        spreadRadius: 1,
        offset: const Offset(0, 4),
      ),
        ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
horizontal: 22,
vertical: 10,
),
          child: ReusableText(text: text, fweight: FontWeight.w400, textColor: Colors.black, size: 12),
          ),
      ),
    );
  }
}


