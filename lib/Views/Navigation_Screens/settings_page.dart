

import 'package:flutter/material.dart';
import 'package:login_app/Models/Classes/app_settings.dart';
import 'package:login_app/Views/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';



class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  String Email = "";

  @override
  initState(){
    super.initState();
    getUserEmail();
  }

  Future<void> getUserEmail() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    Email = prefs.getString(AppSettings.emailSharedPreferances)?? "__";
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        CircleAvatar(
          radius: 100,
          child: Image.asset("assets/images/mylogo.png"),
        ),
        SizedBox(height: MediaQuery.of(context).size.height *.04,),

        const Center(child: Text("Username : --",style: TextStyle(fontSize: 16),)),
        Center(child: Text(Email,style: const TextStyle(fontSize: 16),)),

        SizedBox(height: MediaQuery.of(context).size.height *.04,),
        reusableListTitle((){}, Icons.edit ,"Edit Profile", "Manage your account"),

        SizedBox(height: MediaQuery.of(context).size.height *.03,),
        reusableListTitle((){}, Icons.settings ,"App Settings", "Manage your settings"),

        SizedBox(height: MediaQuery.of(context).size.height *.03,),
        reusableListTitle((){} , Icons.info_outline ,"About App", "Data about developer and application"),


      ],
    );
  }
}
