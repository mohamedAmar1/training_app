


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemCount: 20,
      itemBuilder: (BuildContext context , int index){
          return Padding(padding:EdgeInsets.all(10),
          child: Center(
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(colors: [
                  hexaToString("CB2B93"),
                  hexaToString("9546C4"),
                  hexaToString("5E61F4")
                ], begin: Alignment.centerLeft, end: Alignment.bottomCenter),
                boxShadow: const [BoxShadow(
                  color: Colors.black54,
                  offset: Offset(8,4),
                  blurRadius: 12,
                )],
              ),
              child: Icon(Icons.flash_auto,color: Colors.white,size: 30,),
            ),
          ),
          );
      }
    );
  }
}
