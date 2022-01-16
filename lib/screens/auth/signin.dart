import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:relexai/auth_services/authServices.dart';
import 'package:relexai/screens/auth/registeration.dart';
class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({required this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth= AuthService();

  // text states foe signin field
  String email= '';
  String passward= '';
  String error= '';

  // Initiallizing a global Validator
  final _formKey =  GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Seting background color
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.greenAccent[100],
        title: Text("Relexai - Sign in", style: TextStyle(color: Colors.black87), ),

      //   Register Button
        actions: [
          TextButton.icon(
            onPressed: (){
              widget.toggleView();
            },
            icon: Icon(Icons.person, color: Colors.black87,),
            label: Text("Register ",style: TextStyle(color: Colors.black87)) ,)
        ],
      ),
      body: Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: 20),
                TextFormField(// For Email
                  style: TextStyle(color: Colors.black87),
                  validator: (val) => val!.isEmpty ? "Enter a valid Email" : null,
                  onChanged: (val){ // val = the value user enters will be stored in the val variable
                    // now set the val to email.
                    setState(() {
                      email = val;
                    });
                  },
                ),
                SizedBox(height: 20,),
                TextFormField( // For Passward

                  obscureText: true,
                  style: TextStyle(color: Colors.black87),

                  validator: (val) => val!.length < 6 ? "Enter 6+ char long passward" : null ,

                  onChanged: (val){
                    setState(() {
                     passward = val;
                    });
                  },
                ),
                SizedBox(height: 20,),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.greenAccent[100],

                  ),
                  child: Text("Sign in", style: TextStyle(color: Colors.black87, letterSpacing: 1)),
                  onPressed: () async{
                    if(_formKey.currentState!.validate()){
                    print("Email: $email");
                    print("Passward: $passward");
                  }
                },
                ),
              ],
            ),
          ),

      ),

    );
  }
}

