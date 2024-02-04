import 'package:flutter/material.dart';
import 'package:login_app/Models/Classes/app_settings.dart';
import 'package:login_app/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Models/Screens/login_screen.dart';



void main() {
  runApp(HomePage());
}

class HomePage extends StatefulWidget {
   HomePage({super.key});

  String logValue="";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  Future<void> checkState() async {
    final SharedPreferences prefs = await
    SharedPreferences.getInstance();
    widget.logValue = prefs.getString(AppSettings.phoneIdSharedPreferances) ?? "";
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: widget.logValue.length == 0 ? Login():HomeScreen(),
    );
  }
}
