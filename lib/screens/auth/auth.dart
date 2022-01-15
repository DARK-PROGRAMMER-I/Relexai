import 'package:flutter/cupertino.dart';
import 'package:relexai/screens/auth/registeration.dart';
import 'package:relexai/screens/auth/signin.dart';

class Auth extends StatefulWidget {
  const Auth({Key? key}) : super(key: key);

  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {

  bool isSignedIn= true;

  // we need to create a fucntion so that we could change the isSignedIn state
  void toggleView(){
    setState(()=> isSignedIn = !isSignedIn);
  }

  @override
  Widget build(BuildContext context) {
    if(isSignedIn){
      return SignIn(toggleView: toggleView); // we have passsed this function as a parameter so that we could access this function in Signin form as well
    }else{
      return Register(toggleView: toggleView);// we have passsed this function as a parameter so that we could access this function in Register form as well
    }
  }
}
