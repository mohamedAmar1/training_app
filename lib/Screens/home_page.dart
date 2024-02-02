

import 'package:flutter/material.dart';
import 'package:login_app/product_details.dart';
import 'package:login_app/utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> product = ["item1", "item2", "item4", "item5", "item6", "item7", "item8", "item9", "item10",];
  List<int> price = [10, 15, 20, 30, 40, 50, 60, 65, 70,];
  List<IconData> icons = [
    Icons.icecream_outlined,
    Icons.ac_unit_rounded,
    Icons.adb,
    Icons.account_balance_wallet_outlined,
    Icons.account_balance_wallet,
    Icons.account_tree_sharp,
    Icons.ad_units,
    Icons.account_tree_outlined,
    Icons.account_balance,
    Icons.ac_unit
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
          itemCount: product.length,
          itemBuilder: (context, index) {
        return InkWell(child: itemCard(icons[index], product[index], price[index]) , onTap: (){
          Navigator.push(context,
            MaterialPageRoute(builder: (context) => ProductDetails( product_name:product[index] , price: price[index] , ),)
            );
        },);
      },
      padding: EdgeInsets.all(10),
    );
  }
}
