import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:relexai/models/firebase_user.dart';
import 'package:relexai/screens/auth/auth.dart';
import 'package:relexai/screens/home/home.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // So lets first get the user ID from the Provider Widget

    final user= Provider.of<FirebaseUser?>(context);
    // print(user);

    // Here we want to show the screen based on the userId

    if (user == null){
      return Auth();
    }else{
      return Home();
    }
  }
}
