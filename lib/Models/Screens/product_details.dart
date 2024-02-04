

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  final int price;
  final String product_name;
  final List<String> images;
  final String desicrption;

   ProductDetails( {super.key ,
     required this.product_name,
     required this.price,
     required this.images,
     required this.desicrption
   });

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {


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
                    items: widget.images.map((item) => Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      width: MediaQuery.of(context).size.width*0.9,
                      margin: EdgeInsets.all(10),
                      child: Center(
                          child: Image.network(item, fit: BoxFit.cover, width: 1000)),
                       )).toList(),
                  )
              ),
              const SizedBox(height: 50,),
              Text("Price : ${widget.price} \$" , style: TextStyle(fontSize: 35),),
              const SizedBox(height: 20,),
              Text("${widget.desicrption}" ,
                style:const TextStyle(fontSize: 20),)
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
