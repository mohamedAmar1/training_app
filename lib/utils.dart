import 'package:flutter/material.dart';
import 'dart:ui';

hexaToString(String hexColor){
  hexColor = hexColor.toUpperCase().replaceAll("#", "");
  if(hexColor.length == 6){
    hexColor = "FF"+ hexColor;
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


Container itemCard (IconData icon, String title, int price){
  return Container(

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
        Icon(icon,size: 20,color: Colors.white,),
        Text(title, style: const TextStyle(fontSize: 16, color: Colors.white),),
        Text("$price L.E", style: const TextStyle(fontSize: 15, color: Colors.white),),
        
      ],
    ),
  );
}



Container reusableListTitle(IconData leadingIcon ,String title , String subTitle){
  return Container(
    padding: const EdgeInsets.all(10),
    decoration:BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: [BoxShadow(
            color: Colors.deepPurple.shade400,
            blurRadius: 8,
            blurStyle: BlurStyle.solid,
            offset: const Offset(5,10)
        )]
    ),
    child: ListTile(
      leading: Icon(leadingIcon,size: 28,color: Colors.white,),
      title: Text(title,style: const TextStyle(color:Colors.white,fontSize: 18 , fontWeight:FontWeight.w600),),
      subtitle: Text(subTitle,style: const TextStyle(color:Colors.white,fontSize: 13)),
      trailing: Icon(Icons.arrow_forward_ios,size: 28,color: Colors.white,),
    ),
  );
}