

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Classes/app_settings.dart';
import '../utils.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  String phoneId = "";

  @override
  initState(){
    super.initState();
    getUserPhone();
  }

  Future<void> getUserPhone() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    phoneId = prefs.getString(AppSettings.phoneIdSharedPreferances)?? "__";
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(15),
      children: [
        CircleAvatar(
          radius: 120,
          child: Image.asset("assets/images/mylogo.png"),
        ),
        SizedBox(height: MediaQuery.of(context).size.height *.04,),

        Center(child: Text("Phone : $phoneId",style: TextStyle(fontSize: 16),)),
        SizedBox(height: MediaQuery.of(context).size.height *.04,),

        reusableListTitle(Icons.edit ,"Edit Profile", "Manage your account"),

        SizedBox(height: MediaQuery.of(context).size.height *.03,),

        reusableListTitle(Icons.settings ,"App Settings", "Manage your settings"),

        SizedBox(height: MediaQuery.of(context).size.height *.03,),

        reusableListTitle(Icons.info_outline ,"About App", "Data about developer and application"),



      ],
    );
  }
}
