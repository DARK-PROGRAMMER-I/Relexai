import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:relexai/auth_services/authServices.dart';
import 'package:relexai/screens/auth/signin.dart';
import 'package:relexai/shared/constants.dart';
import 'package:relexai/shared/loading.dart';

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
  String error= '';

  // Loading screen
  bool loading= false;


  // Form key instance
  final _formKey= GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return loading ? Loading(): Scaffold(
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
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 20),
              TextFormField(// For Email
                decoration: input_decoration_textField("Email"),
                validator: (val) => val!.isEmpty ? "Enter valid email": null ,
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
                decoration: input_decoration_textField("Passward "),
                obscureText: true,
                style: TextStyle(color: Colors.black87),
                validator: (val)=> val!.length < 6 ? "Please enter 6+ char passward!": null,
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
                  if(_formKey.currentState!.validate()){
                    setState(() => loading= true);
                    dynamic result= await _auth.registerWithEmailAndPass(email, passward);
                    // if the result is equal to null, in that case we will update the error! Otherwise error will not be updated!
                    if(result == null){
                      setState(() {
                        error= "Enter valid Email!";
                        loading= false;
                      });
                    }
                  }

                },
              ),
              SizedBox(height: 15,),
              Text(error,
              style: TextStyle(color: Colors.red, fontSize: 14),
              )
            ],
          ),
        ),

      ),

    );
  }
}
