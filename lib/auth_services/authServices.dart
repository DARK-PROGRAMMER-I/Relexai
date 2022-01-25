import 'package:firebase_auth/firebase_auth.dart';
import 'package:relexai/auth_services/database.dart';
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
        // .map((User? user) => _getFirebaseUserId(user));
    .map(_getFirebaseUserId);
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
  Future signInWithEmailAndPass(String email, String passward)async{
    try{
      UserCredential result= await _auth.signInWithEmailAndPassword(email: email, password: passward);
      User? user= result.user;
      return _getFirebaseUserId(user);
    }catch(e){
      print(e.toString());

    }
  }

  // Register with email and passward
  Future registerWithEmailAndPass(String email, String passward) async{
    try{
      UserCredential result= await _auth.createUserWithEmailAndPassword(email: email, password: passward);
      User? user= result.user;
      // Here before we pass the user to the getId function, we will first
      // make a document with uid
      // we will also use the Function we created in the DataBaseService to update the prefrences
      await DatabaseServices(user!.uid).updateUserData("4", "malik-ge", 100); // here we are just using a dummy data

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