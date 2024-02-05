

import 'package:flutter/material.dart';
import 'package:login_app/Models/Classes/product_model.dart';
import 'package:login_app/Views/utils.dart';
import 'package:login_app/Servcies/service_model.dart';
import '../Screens/product_details.dart';

class HomePage extends StatefulWidget {
   const HomePage({super.key});





  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool isLoading = true;
  List <Product> productList = [];

  Future <void> getData() async {
    productList = await ProductService.getProductsData();
    isLoading = false;
    setState(() {});
  }


  @override
  void initState(){
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading?
    const Center(child: CircularProgressIndicator(color: Colors.deepPurple),):
    ListView.builder(
          itemCount: productList.length,
          itemBuilder: (context, index) {
        return InkWell(child: itemCard(productList[index].images??[], productList[index].title.toString() , productList[index].price?? 0) , onTap: (){
          Navigator.push(context,
            MaterialPageRoute(builder: (context) => ProductDetails(
              product_name:productList[index].title??"--",
              price: productList[index].price ??0 ,
              images: productList[index].images??[],
              desicrption: productList[index].description??"--" ,
            ),)
            );
        },);
      },
      padding: const EdgeInsets.all(10),
    );
  }
}
