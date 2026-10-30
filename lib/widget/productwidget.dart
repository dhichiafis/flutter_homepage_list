import 'package:flutter/material.dart';
import 'package:flutterlist/pages/productdetail.dart';
import 'package:flutterlist/widget/reusabletext.dart';
import 'package:flutterlist/data/data.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({super.key,required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(10),

  boxShadow: [
    BoxShadow(
      color: Colors.black.withOpacity(0.15),
      blurRadius: 8,
      spreadRadius: 1,
      offset: const Offset(0, 4),
    ),
  ],
),
        child: Column(
          children: [
            //Image.asset(name)
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
          return ProductDetail(product: product,);
        }));
              },
              child: ClipRRect(
                child: Image.network(
                  width: double.infinity,
                  height: 100,
                  '${product.image}'
                  ,fit: BoxFit.cover,),
              ),
            ),
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 ReusableText(text: '${product.title}', fweight: FontWeight.w600, textColor: Colors.black, size: 14),
              ReusableText(text: 'Ksh ${product.price.toString()}', fweight: FontWeight.w600, textColor: Colors.black, size: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ReusableText(text: '${product.quantity.toString()} items', fweight: FontWeight.w400, textColor: Colors.black, size: 12),
                  IconButton(
                    onPressed: (){}, 
                    icon: Icon(Icons.shopping_bag,color: Colors.black,))
                ],
              )
              ],
             ),
           )
          ],
        ),
  //    ),
    );
  }
}