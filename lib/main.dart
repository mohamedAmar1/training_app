
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:login_app/Models/Classes/app_settings.dart';
import 'package:login_app/Views/Screens/Regestration_screens/login_screen.dart';
import 'package:login_app/firebase_options.dart';
import 'package:login_app/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';




Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FlutterNativeSplash.removeAfter(initialization);
  runApp(HomePage());

}

Future initialization(BuildContext? context) async {
  await Future.delayed(const Duration(seconds: 1));
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
    widget.logValue = prefs.getString(AppSettings.emailSharedPreferances) ?? "";
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
      home: widget.logValue.isEmpty ? Login():HomeScreen(),
    );
  }
}
