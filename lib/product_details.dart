

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  final int price;
  final String product_name;
   ProductDetails( {super.key , required this.product_name, required this.price});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {


  List<String> imgList = [
    "assets/images/imag.jpg",
    "assets/images/imag2.jpg",
    "assets/images/imag3.jpg",
    "assets/images/imag4.jpg",
    "assets/images/imag5.jpg",
    "assets/images/imag6.jpg",
    "assets/images/imag7.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.product_name,style: TextStyle(fontSize: 25),),),
        body:Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              Container(
                  child: CarouselSlider(
                    options: CarouselOptions(),
                    items: imgList.map((item) => Container(
                      width: MediaQuery.of(context).size.width*0.9,
                      margin: EdgeInsets.all(10),
                      child: Center(
                          child: Image.asset(item, fit: BoxFit.cover, width: 1000)),
                       )).toList(),
                  )
              ),
              const SizedBox(height: 50,),
              Text("Price : "+widget.price.toString() , style: TextStyle(fontSize: 35),),
              const SizedBox(height: 20,),
              Text("Contrary to popular belief, Lorem Ipsum is not simply"
                  " random text. It has roots in a piece of classical Latin "
                  "literature from 45 BC, making it over 2000 years old. Richard McClintock,"
                  " a Latin professor at Hampden-Sydney College in Virginia, looked up one of "
                  "the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and "
                  "going through the cites of the word in classical literature, discovered the "
                  "undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of de "
                  "Finibus Bonorum et Malorum The Extremes of Good and Evil) by Cicero, written in "
                  "45 BC. This book is a treatise on the theory of ethics, very popular during the "
                  "Renaissance. The first line of Lorem Ipsum, comes from a line in section 1.10.32." ,
                style:TextStyle(fontSize: 20),)
            ],
          ),
        ) ,
      floatingActionButton: FloatingActionButton(onPressed: () {

      },
        child: Icon(Icons.add_shopping_cart),
      ),
    );
  }
}
