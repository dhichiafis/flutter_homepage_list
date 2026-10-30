import 'package:flutter/material.dart';
import 'package:flutterlist/data/data.dart';
import 'package:flutterlist/widget/productwidget.dart';
import 'package:flutterlist/widget/reusabletext.dart';
import 'package:flutterlist/widget/tappableitem.dart';
//this page contains the filtering functionality of all the products theat we would wish to display to our user
//this is the general functionality of home pages 
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String searchText='';
  bool isActive=false;
  //we are displaying the manipulated list by serach functionality and button press
  List<Product> filteredProducts=[];
  final List<Product> products=[
    Product(id: 1, quantity: 12, title: 'tiger', description: "this is  a solu tiger", price: 23444, image: 'https://images.unsplash.com/photo-1615963244664-5b845b2025ee?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=NHwxMjA3fDA%3D'),
    Product(id: 2, quantity: 12, title: 'Lizard', description: "this is  a solu tiger", price: 23444, image: 'https://images.unsplash.com/photo-1615963244664-5b845b2025ee?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=NHwxMjA3fDA%3D'),
    Product(id: 3, quantity: 12, title: 'zebra', description: "this is  a solu tiger", price: 23444, image: 'https://images.unsplash.com/photo-1615963244664-5b845b2025ee?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=NHwxMjA3fDA%3D'),
    Product(id: 4, quantity: 12, title: 'cheetah', description: "this is  a solu tiger", price: 23444, image: 'https://images.unsplash.com/photo-1615963244664-5b845b2025ee?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=NHwxMjA3fDA%3D'),
//    Product(id: 5, quantity: 12, title: 'Leopard', description: "this is  a solu tiger", price: 23444, image: ''),
    Product(id: 6, quantity: 12, title: 'hyena', description: "this is  a solu tiger", price: 23444, image: 'https://images.unsplash.com/photo-1608543104100-c24c77541d16?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=NHwxMjA3fDA%3D'),
    Product(id: 7, quantity: 12, title: 'chameleon', description: "this is  a solu tiger", price: 23444, image: 'https://plus.unsplash.com/premium_photo-1722827117771-51f0f24a9a1f?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=NHwxMjA3fDA%3D'),
    Product(id: 1, quantity: 12, title: 'tiger', description: "this is  a solu tiger", price: 23444, image: 'https://images.unsplash.com/photo-1615963244664-5b845b2025ee?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=NHwxMjA3fDA%3D'),
  ];

  void filterByTitle(String text){
    setState(() {
      searchText=text;
      filteredProducts=products.where((product){
        return product.title.toLowerCase().contains(searchText.toLowerCase());
      }).toList();
    });
  }
  void initState(){
    super.initState();
    getAllProducts();
  }
  
  void getAllProducts(){
    setState(() {
      isActive=true;
      filteredProducts=products;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 12,right: 12),
          child: Column(
          
            children: [
              SizedBox(height: 40,),
              Container(
                height: 80,
                child: TextField(
                  onChanged: (value){
                    filterByTitle(value);
                  },
                  //controller: searchText,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      
                      ),
                    )
                  ),
                ),
                
              
              SizedBox(height: 8,),
              SizedBox(
                height: 70,
                child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  TapableItem(text:'All',onTap: getAllProducts,),
                  
                ],
              )),
              SizedBox(height: 12,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ReusableText(text: 'Products', fweight: FontWeight.w800, textColor: Colors.black, size: 24),
                  ReusableText(text: 'View all', fweight: FontWeight.w800, textColor: Colors.black12, size: 24),
                ],
              ),
              Expanded(
                child: GridView(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15,
                    childAspectRatio: 0.75
                    )
                  ,
                  children: [
                   ... filteredProducts.map((product){
                      return ProductWidget(product: product);
                    }).toList()
                    ,SizedBox(height: 40,)
                  ],
                  
                  ),
                  ),
                  
            ]),
        ),
      )
      
    );
  }
}