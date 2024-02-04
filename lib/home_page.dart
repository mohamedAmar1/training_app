


import 'package:flutter/material.dart';
import 'package:login_app/Models/Classes/app_settings.dart';
import 'package:login_app/Models/Navigation_Screens/home_page.dart';
import 'package:login_app/Models/Screens/cart_screen.dart';
import 'package:login_app/Models/utils.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'Models/Navigation_Screens/categories_page.dart';
import 'Models/Navigation_Screens/settings_page.dart';
import 'Models/Screens/login_screen.dart';



class HomeScreen extends StatefulWidget {
  final String? phoneNumber;
  final String? password;
  const HomeScreen({super.key ,  this.phoneNumber,  this.password});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> pages=[
    HomePage(),
    CategoryPage(),
    SettingPage(),
  ];
  int pageIndex = 0;
  String phone="";

  Future<void> getPhone() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    phone = prefs.getString(AppSettings.phoneIdSharedPreferances)??"--";
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPhone();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),

      drawer: Drawer(
        width: MediaQuery.of(context).size.width*0.7,
        child:
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    color: Colors.deepPurple,
                    width: double.infinity,
                    height: 300,
                    child: Column(
                      children: [
                        SizedBox(height: 50,),
                        CircleAvatar(
                          radius: 80,
                          child: Image.asset("assets/images/mylogo.png"),
                        ),
                        SizedBox(height: 10,),
                        Text("Username : __" , style: TextStyle(color: Colors.white),),
                        Text("Phone : ${phone}", style: TextStyle(color: Colors.white),),
                      ],
                    ),
                  ),
              
                  SizedBox(height: 30,),
                  reusableInkwel((){
                    //-------action -----------
                    },
                    Icons.person_outline  , "Profile" ,
                      Colors.indigo
                  ),
              
                  reusableInkwel((){
                    //-------action -----------
                  },
                    Icons.shopping_cart_checkout  , "Add Product" ,
                      Colors.indigo
                  ),
              
                  reusableInkwel((){
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CartPage(),)
                    );
                  },
                    Icons.shopping_cart_rounded , " Cart" ,
                    Colors.indigo
                  ),
              
                  reusableInkwel((){
                    //-------action -----------
                  },
                    Icons.shopping_cart_rounded , "Settings" ,
                    Colors.indigo
                  ),
                  Divider(),
              
                  reusableInkwel(() => _showMyDialog(),
                      Icons.exit_to_app  , "Log out",
                      Colors.redAccent
                       ),
                  SizedBox(height: 30,),
                  InkWell(
                    onTap: (){
                      //------go to developer infoPage
                    },
                      child: Text("About  !!" )),
              
              
                ]
              ),
            ),
      ),

      body:pages[pageIndex],
      bottomNavigationBar:BottomNavigationBar(
        currentIndex:pageIndex,
        onTap:onNavBarTapped ,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home",),
          BottomNavigationBarItem(icon: Icon(Icons.category),label: "Category"),
          BottomNavigationBarItem(icon: Icon(Icons.settings),label: "Settings"),
        ],

      ),
    );
  }

  onNavBarTapped(int index){
    pageIndex = index;
    setState(() {
    });
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Sign out"),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text("Are you wan't to sign out?"),
                Text("You will need to login again!!"),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Ok'),
              onPressed: () async {
                final SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.clear();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => Login())
                );
              },
            ),

            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

}



