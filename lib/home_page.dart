
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:login_app/Models/Classes/app_settings.dart';
import 'package:login_app/Views/Screens/add_category_page.dart';
import 'package:login_app/Views/Screens/cart_screen.dart';
import 'package:login_app/Views/Screens/Regestration_screens/login_screen.dart';
import 'package:login_app/Views/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Views/Navigation_Screens/categories_page.dart';
import 'Views/Navigation_Screens/home_page.dart';
import 'Views/Navigation_Screens/settings_page.dart';




class HomeScreen extends StatefulWidget {
  final String? phoneNumber;
  final String? password;
  const HomeScreen({super.key ,  this.phoneNumber,  this.password});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> pages=[
    const HomePage(),
    const CategoryPage(),
    const SettingPage(),
  ];
  int pageIndex = 0;
  String phone="";

  Future<void> getPhone() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    phone = prefs.getString(AppSettings.emailSharedPreferances)??"--";
    setState(() {

    });
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
                        const SizedBox(height: 50,),
                        CircleAvatar(
                          radius: 80,
                          child: Image.asset("assets/images/mylogo.png"),
                        ),
                        const SizedBox(height: 10,),
                        const Text("Username : __" , style: TextStyle(color: Colors.white),),
                        Text("${phone}", style: const TextStyle(color: Colors.white),),
                      ],
                    ),
                  ),
              
                  const SizedBox(height: 30,),
                  reusableInkwel((){
                    //-------action -----------
                    },
                    Icons.person_outline  , "Profile" ,
                      Colors.indigo
                  ),
              
                  reusableInkwel((){
                    Navigator.push(context,
                    MaterialPageRoute(builder: (context)=>const AddCategory().
                    animate().moveY(delay: const Duration(milliseconds: 400),))
                    );
                  },
                    Icons.shopping_cart_checkout  , "Add Product" ,
                      Colors.indigo
                  ),
              
                  reusableInkwel((){
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const CartPage(),)
                    );
                  },
                    Icons.shopping_cart_rounded , " Cart" ,
                    Colors.indigo
                  ),
              
                  reusableInkwel((){
                    //-------action -----------
                  },
                    Icons.settings, "Settings" ,
                    Colors.indigo
                  ),
                  const Divider(),
              
                  reusableInkwel(() => _showMyDialog(),
                      Icons.exit_to_app  , "Log out",
                      Colors.redAccent
                       ),
                  const SizedBox(height: 30,),
                  InkWell(
                    onTap: (){
                      //------go to developer infoPage
                    },
                      child: const Text("About  !!" )),
              
              
                ]
              ),
            ),
      ).animate().fadeIn(duration: Duration(milliseconds: 400)),

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
                await FirebaseAuth.instance.signOut();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const Login())
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
        ).animate().flipV();
      },
    );
  }

}



