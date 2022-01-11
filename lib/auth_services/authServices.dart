import 'package:firebase_auth/firebase_auth.dart';
import 'package:relexai/models/firebase_user.dart';

class AuthService {
  final FirebaseAuth _auth= FirebaseAuth.instance;

  // Create a saperate function for FirebaseUser
  FirebaseUser? _getFirebaseUserId(User? user){
    return user != null ?  FirebaseUser(userId: user.uid) : null;
  }

  // String _getFirebaseUserId(User? user){
  //   var result= null;
  //   if(user != null){
  //     result = user.uid;
  //     return result;
  //   }else{
  //     return "Fuck you";
  //   }
  // }

  // We will create different methods of Authentication
  // Sign In Anonumosly
  Future signInAnon() async{
    try{
      UserCredential result= await _auth.signInAnonymously();
      User? user = result.user;
      return _getFirebaseUserId(user);
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