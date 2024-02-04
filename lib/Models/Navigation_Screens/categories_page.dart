import 'package:flutter/material.dart';
import '../utils.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  List<IconData> icons = [
    Icons.electric_bolt_outlined,
    Icons.play_circle_outline_sharp,
    Icons.adb,
  ];

  List<String> titles = ["electric","Moves","phones"];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemCount: icons.length,
      itemBuilder: (BuildContext context , int index){
          return reusableContainer(icons[index] ,titles[index] , (){});
      }
    );
  }
}
