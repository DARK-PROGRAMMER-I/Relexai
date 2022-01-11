import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:relexai/auth_services/authServices.dart';
class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth= AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Seting background color
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.greenAccent[100],
        title: Text("Relexai - Damo App", style: TextStyle(color: Colors.black87), ),
      ),
      body: Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
          child: ElevatedButton(
            onPressed: () async {
              dynamic result= await _auth.signInAnon();
              if(result == null){
                print("Sign In fialed");
              }else{
                print("Sign In Successfull");
                print(result.userId);
              }
            },
            child: Text("SignIn", style: TextStyle(color: Colors.black87, letterSpacing: 1.5, fontSize: 15, fontWeight: FontWeight.bold ), ) ,
            style: ElevatedButton.styleFrom(
                primary: Colors.greenAccent[100]
            ),
          )

      ),

    );
  }
}

