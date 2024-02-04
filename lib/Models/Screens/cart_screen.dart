

import 'package:flutter/material.dart';
import 'package:login_app/Models/Classes/cart_model.dart';

import 'package:login_app/Models/utils.dart';
import 'package:login_app/Servcies/cart_service.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});



  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  int TotalPay = 0;
  int totalItem = 0;
  bool isLoading = true;
  List<Product> cartList = [];

  Future<void> getData() async {
    cartList = await CartService.getCartData();
    totalItem = cartList.length;
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
    isLoading = false;

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    body:isLoading? const Center(child: CircularProgressIndicator(color:Colors.deepPurple ,)):
    ListView.builder(
      itemCount: cartList.length,
      itemBuilder: (context , index){
        TotalPay += cartList[index].total??0;

          return InkWell(child:CartItem(
            cartList[index].thumbnail ??"" ,
            cartList[index].id??0 ,
            cartList[index].title??"" ,
            cartList[index].discountedPrice?? 0,
            cartList[index].quantity??0 ,
            cartList[index].discountPercentage??0.0 ,
            cartList[index].price??0 ,
            cartList[index].total?? 0,
          ),

            onTap: (){},);
        }
    ),

    );

  }

}
