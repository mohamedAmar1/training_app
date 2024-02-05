
import 'package:flutter/material.dart';
import 'package:login_app/Models/Core/firebase_auth.dart';
import 'package:login_app/Views/Screens/Regestration_screens/login_screen.dart';
import 'package:login_app/Views/utils.dart';


class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passTextController = TextEditingController();
  // TextEditingController _passTextController2 = TextEditingController();

  bool isLoading = false ;
  final _formKey = GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sign Up"),),
      body: isLoading == true?Center(child: CircularProgressIndicator(color: Colors.deepPurple,),) :
      Form(
        key: _formKey,
        child: Container(
          height: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                hexaToString("CB2B93"),
                hexaToString("9548C4"),
                hexaToString("1E61F4")
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                  20, MediaQuery.of(context).size.height * 0.09, 20, 0),
              child: Column(
                children: [

                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(

                    controller: _emailTextController,
                    keyboardType: TextInputType.emailAddress,
                    cursorColor: Colors.white,
                    style: TextStyle(color: Colors.white.withOpacity(0.9)),
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.mail,
                        color: Colors.white70,
                      ),
                      labelText: "Email",
                      labelStyle:
                      TextStyle(color: Colors.white.withOpacity(0.8)),
                      filled: true,
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      fillColor: Colors.white.withOpacity(0.3),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: const BorderSide(
                              width: 0, style: BorderStyle.none)),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Invalid email address";
                      } else {
                        return null;
                      }
                    },

                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _passTextController,
                    cursorColor: Colors.white,
                    obscureText: true,
                    style: TextStyle(color: Colors.white.withOpacity(0.8)),
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.lock_outline,
                        color: Colors.white70,
                      ),
                      labelText: "Password",
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
                        return "Invalid password";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),

                  reusableButton(context, false, () async {
                    if (_formKey.currentState!.validate()) {
                      isLoading = true;
                      setState(() {});
                      bool logResult = await FirebaseAuthUtils.createAccount(email: _emailTextController.text, password: _passTextController.text);

                      if(logResult){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login()));
                        var snackBar = const SnackBar(content: Text("Sccessful Create Account "));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }else{
                        var snackBar = const SnackBar(
                          backgroundColor: Colors.black12,
                            content: Text("Invalid Password or maybe this Account already exist ?"));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                      isLoading = false;
                      setState(() {});

                    }
                  }),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("I have an account ✔   ",
                          style: TextStyle(color: Colors.white)),
                      InkWell(
                        onTap: (){
                          Navigator.pop(context);
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, color: Colors.white,fontSize: 16),
                          )
                      ),
                    ],
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
