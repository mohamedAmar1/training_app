import 'package:flutter/material.dart';
import 'package:login_app/Models/Classes/app_settings.dart';
import 'package:login_app/home_page.dart';
import 'package:login_app/Models/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';



class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _phoneTextController = TextEditingController();
  TextEditingController _passTextController = TextEditingController();
  String logValue="";
  final _formKey = GlobalKey<FormState>();

  Future() async {
  final SharedPreferences prefs = await
  SharedPreferences.getInstance();
  logValue = prefs.getString(AppSettings.phoneIdSharedPreferances) ?? "_";
  }

  @override
   initState(){
    // TODO: implement initState
    super.initState();
    if(logValue.length > 2){
      Navigator.push(context, MaterialPageRoute(
            builder: (context) => HomeScreen(),)
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Container(
          height: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            hexaToString("CB2B93"),
            hexaToString("9546C4"),
            hexaToString("5E61F4")
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                  20, MediaQuery.of(context).size.height * 0.09, 20, 0),
              child: Column(
                children: [
                  Image.asset("assets/images/mylogo.png",width: 300,),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    maxLength: 11,
                    controller: _phoneTextController,
                    keyboardType: TextInputType.phone,
                    cursorColor: Colors.white,
                    style: TextStyle(color: Colors.white.withOpacity(0.9)),
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.phone,
                        color: Colors.white70,
                      ),
                      labelText: "Phone Number",
                      labelStyle:
                          TextStyle(color: Colors.white.withOpacity(0.9)),
                      filled: true,
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      fillColor: Colors.white.withOpacity(0.3),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: const BorderSide(
                              width: 0, style: BorderStyle.none)),
                    ),
                    validator: (value) {
                      if (value!.length < 11) {
                        return "Invalid phone number";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _passTextController,
                    cursorColor: Colors.white,
                    obscureText: true,
                    style: TextStyle(color: Colors.white.withOpacity(0.9)),
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.lock_outline,
                        color: Colors.white70,
                      ),
                      labelText: "Password",
                      labelStyle:
                          TextStyle(color: Colors.white.withOpacity(0.9)),
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
                        return "Invalid password";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  reusableButton(context, true, () async {
                    if (_formKey.currentState!.validate()) {
                      final SharedPreferences prefs = await SharedPreferences.getInstance();
                      prefs.setString(AppSettings.phoneIdSharedPreferances,  _phoneTextController.text);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(
                              phoneNumber: _phoneTextController.text,
                              password: _passTextController.text,
                            ),
                          ));

                    }
                  }),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Forget Password?  ",
                          style: TextStyle(color: Colors.white)),
                      InkWell(
                          child: Text(
                        "Tap me",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ))
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  reusableButton(context, false, () {}),
                  const SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
