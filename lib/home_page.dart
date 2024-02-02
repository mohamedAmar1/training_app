


import 'package:flutter/material.dart';
import 'package:login_app/login_screen.dart';

import 'Screens/categories_page.dart';
import 'Screens/home_page.dart';
import 'Screens/settings_page.dart';

class HomeScreen extends StatefulWidget {
  final String phoneNumber;
  final String password;
  const HomeScreen({super.key , required this.phoneNumber, required this.password});

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),

      drawer: Drawer(
        width: MediaQuery.of(context).size.width*0.6,
        child: ListView(
          padding: EdgeInsets.all(10),
          children: [
            SizedBox(height: 200,),
            InkWell(
              onTap:(){
                _showMyDialog();
              },
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(Icons.exit_to_app,size: 30,),
                    Text(" Log out",style: TextStyle(fontSize: 18),),
                    Icon(Icons.arrow_forward_ios,size: 30,),
                  ],
                ),
              ),
            )
          ],
        ),
      ),

      body:pages[pageIndex],
      bottomNavigationBar:BottomNavigationBar(
        currentIndex:pageIndex,
        onTap:onNavBarTapped ,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
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
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context)=> Login())
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
