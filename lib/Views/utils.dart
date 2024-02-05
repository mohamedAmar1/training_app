
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:login_app/Models/Core/firebase_cloud_store_utils.dart';


hexaToString(String hexColor){
  hexColor = hexColor.toUpperCase().replaceAll("#", "");
  if(hexColor.length == 6){
    hexColor = "FF$hexColor";
  }
  return Color(int.parse(hexColor, radix:16));
}

Container reusableTextField(TextEditingController TextController , IconData icon, String label){
  return Container(
    margin: EdgeInsets.all(10),
    child: TextFormField(
      controller: TextController,
      cursorColor: Colors.white,
      // obscureText: true,
      style: TextStyle(color: Colors.white.withOpacity(0.8)),
      decoration: InputDecoration(
        prefixIcon: Icon(
          icon,
          color: Colors.white70,
        ),
        labelText: label,
        labelStyle:
        TextStyle(color: Colors.white.withOpacity(0.7)),
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        fillColor: Colors.white.withOpacity(0.3),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: const BorderSide(
                width: 0, style: BorderStyle.none)),
      ),
      validator: (value) {
        if (value!.length < 2) {
          return "Invalid Item value";
        } else {
          return null;
        }
      },
    ),
  );
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


Container reusableContainer(BuildContext context , String name ,  String item_no , String image , String id ){
   return Container(
            margin:const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: LinearGradient(colors: [
                hexaToString("CB2f93"),
                hexaToString("9946C4"),
                hexaToString("5E61F4")
              ], begin: Alignment.centerLeft, end: Alignment.bottomCenter),
              boxShadow: const [BoxShadow(
                color: Colors.black54,
                offset: Offset(8,4),
                blurRadius: 15,
              )],
            ),
            child: Column(
              children: [
                const SizedBox(height: 10,),
                CircleAvatar(radius: 55, foregroundImage:NetworkImage(image??"https://t4.ftcdn.net/jpg/04/73/25/49/360_F_473254957_bxG9yf4ly7OBO5I0O5KABlN930GwaMQz.jpg")),
                Text(name, style:const TextStyle(fontSize: 15, color: Colors.white),),
                Text("item number: $item_no" , style:const TextStyle(fontSize: 15, color: Colors.white),),
                IconButton(onPressed:
                  () async {
                  await FireBaseCloudStroreUtils.deleteCategory(id);
                  if (kDebugMode) {
                    print("Successful delete category");
                  }
                },
                 icon:const Icon(Icons.delete,color: Colors.red,)),
              ],
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


AlertDialog reusableAlertDialog(BuildContext context , String title, String content, Function fun ) {
  return AlertDialog(
    title: Text(title),
    content: SingleChildScrollView(
      child: ListBody(
        children: <Widget>[
          Text(content),
        ],
      ),
    ),
    actions: <Widget>[
      TextButton(
          child: const Text('Ok'),
          onPressed: () {
            fun;
          }
      ),

      TextButton(
        child: const Text('Cancel'),
        onPressed: () {},
      ),
    ],
  );
}



