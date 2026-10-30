import 'package:flutter/material.dart';
import 'package:flutterlist/data/data.dart';
import 'package:flutterlist/widget/reusabletext.dart';
class ProductDetail extends StatelessWidget {
  const ProductDetail({
    super.key,
    required this.product
    });
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Image.network('${product.image}',fit: BoxFit.cover,width: double.infinity,height: MediaQuery.of(context).size.height*0.45,)
            ,Padding(padding: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              //mainAxisSize: MainAxisSize.min,
              children: [
                ReusableText(text: '${product.title}', fweight: FontWeight.bold, textColor: Colors.black, size: 20),
                ReusableText(text: '${product.description}', fweight:FontWeight.w400, textColor: Colors.black, size: 12),
        
              ],
            ),
            
            )
          ],
        ),
      )
    );
  }
}