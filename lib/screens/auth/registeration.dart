import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:relexai/auth_services/authServices.dart';
import 'package:relexai/screens/auth/signin.dart';

class Register extends StatefulWidget {

  // Now here we will create an instance for that function
  final Function toggleView;
  Register({required this.toggleView});

  // const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  AuthService _auth= AuthService();

  String email= '';
  String passward= '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Seting background color
      backgroundColor: Colors.grey[200],




      appBar: AppBar(
        backgroundColor: Colors.greenAccent[100],
        title: Text("Relexai - Sign up", style: TextStyle(color: Colors.black87), ),

        actions: [
          TextButton.icon(
            onPressed: (){
              widget.toggleView();
            },
            icon: Icon(Icons.person, color: Colors.black87,),
            label: Text("Sign in ",style: TextStyle(color: Colors.black87)) ,)
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        child: Form(
          child: Column(
            children: [
              SizedBox(height: 20),
              TextFormField(// For Email
                style: TextStyle(color: Colors.black87),
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
                child: Text("Register", style: TextStyle(color: Colors.black87, letterSpacing: 1)),
                onPressed: () async{
                  print("Email: $email");
                  print("Passward: $passward");

                },
              ),
            ],
          ),
        ),

      ),

    );
  }
}
