import 'package:firebase_auth/firebase_auth.dart';
import 'package:relexai/models/firebase_user.dart';

class AuthService {
  final FirebaseAuth _auth= FirebaseAuth.instance;

  // Create a saperate function for FirebaseUser
  // FirebaseUser

  // We will create different methods of Authentication
  // Sign In Anonumosly
  Future signInAnon() async{
    try{
      UserCredential result= await _auth.signInAnonymously();
      User? user = result.user;
      return user;
    }catch(e)
    {
      print(e.toString());
      return null;
    }
  }

  // SignIn with email and passward

  // SignUp with email

  // SignOut with email



}