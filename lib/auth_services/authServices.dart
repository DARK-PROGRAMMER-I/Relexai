import 'package:firebase_auth/firebase_auth.dart';
import 'package:relexai/models/firebase_user.dart';

class AuthService {
  final FirebaseAuth _auth= FirebaseAuth.instance;

  // Create a saperate function for FirebaseUser
  FirebaseUser? _getFirebaseUserId(User? user){
    return user != null ?  FirebaseUser(userId: user.uid) : null;
  }

  // Firebase user stream. Auth change
  Stream<FirebaseUser?> get user{
    return  _auth.authStateChanges()
        .map((User? user) => _getFirebaseUserId(user));
    // .map(_getFirebaseUserId);
  }

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

  // Register with email and passward
  Future registerWithEmailAndPass(String email, String passward) async{
    try{
      UserCredential result= await _auth.createUserWithEmailAndPassword(email: email, password: passward);
      User? user= result.user;

      return _getFirebaseUserId(user);
    }catch(e){
      print(e.toString());
      return null;

    }
  }

  // SignOut with email
Future signOut() async{
    try{
      return await _auth.signOut();
    }catch(e){
      print(e.toString());
      return null;
    }
}



}