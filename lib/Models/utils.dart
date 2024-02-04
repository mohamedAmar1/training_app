

import 'package:flutter/material.dart';


hexaToString(String hexColor){
  hexColor = hexColor.toUpperCase().replaceAll("#", "");
  if(hexColor.length == 6){
    hexColor = "FF$hexColor";
  }
  return Color(int.parse(hexColor, radix:16));
}


Container reusableButton(BuildContext context , bool isLogin  , Function onTap){
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 50,
    margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),

    child: ElevatedButton(
      onPressed: (){
        onTap();
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith((states){
          if(states.contains(MaterialState.pressed)){
            return Colors.black38;
          }
          return Colors.white;
        }),
        shape:MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))
        ) ,
      ),
      child: Text(
        isLogin? "LOGIN": "SIGN UP"  ,
        style: const TextStyle(
            color: Colors.blueAccent, fontWeight: FontWeight.bold , fontSize: 16),
      ),
    ),
  );
}


SingleChildScrollView itemCard (List<String>image, String title, int price){
  return SingleChildScrollView(
    child: Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(top: 18),
      height: 60,
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

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.network(image[0]),

          Text(title.length< 30? title: "", style: const TextStyle(fontSize: 16, color: Colors.white),),
          Text("$price \$", style: const TextStyle(fontSize: 15, color: Colors.white),),

        ],
      ),
    ),
  );
}



Container reusableListTitle(Function()ontap,IconData leadingIcon ,String title , String subTitle){
  return Container(

    padding: const EdgeInsets.all(5),
    height: 80,
    decoration:BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: [BoxShadow(
            color: Colors.deepPurple.shade400,
            blurRadius: 10,
            blurStyle: BlurStyle.solid,
            offset: const Offset(2,3)
        )]
    ),
    child: InkWell(
      onTap: ontap,
      child: ListTile(
        leading: Icon(leadingIcon,size: 28,color: Colors.white,),
        title: Text(title,style: const TextStyle(color:Colors.white,fontSize: 18 , fontWeight:FontWeight.w600),),
        subtitle: Text(subTitle,style: const TextStyle(color:Colors.white,fontSize: 13)),
        trailing: Icon(Icons.arrow_forward_ios,size: 28,color: Colors.white,),
      ),
    ),
  );
}


InkWell reusableContainer(IconData icon, String title , Function()ontap){
  return InkWell(
    onTap: ontap,
    child: Padding(padding:EdgeInsets.all(10),
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(icon,color: Colors.white,size: 30,),
              Text(title , style: TextStyle(fontSize: 15, color: Colors.white),)
            ],
          ),
        ),
      ),
    ),
  );
}


InkWell reusableInkwel(Function()ontap,IconData beginIcon ,String title , Color color){
  return InkWell(
    onTap:ontap,
    child: Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(beginIcon,size: 30,color: Colors.white,),
          Text("   "+title,style: TextStyle(fontSize: 18,color: Colors.white),),

        ],
      ),
    ),
  );
}


Container CartItem (
    String? imgUrl,
    int id,
    String? title,
    int price ,
    int quantity,
    double discountPercentage,
    int discountedPrice,
    int? total,

    ){
  return  Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(top: 10 ,left: 10 , right:10),

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

      child: Column(

        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
              Image.network(imgUrl??""),
              Text("Id : ${id}",style: const TextStyle(fontSize: 16, color: Colors.white),),
              Text("Price : ${price} \$",style: const TextStyle(fontSize: 16, color: Colors.white),),
              Text("Quantity : ${quantity}", style: const TextStyle(fontSize: 16, color: Colors.white),),
              Text("DiscountPercentage : ${discountPercentage} %",style: const TextStyle(fontSize: 16, color: Colors.white),),
              Text("DiscountedPrice : ${discountedPrice} \$", style: const TextStyle(fontSize: 16, color: Colors.white),),
              Text("Total : ${total} \$", style: const TextStyle(fontSize: 16, color: Colors.white ,fontWeight: FontWeight.bold),),
        ],
      ),
  );
}



