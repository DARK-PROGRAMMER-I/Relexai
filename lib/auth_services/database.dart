import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:relexai/models/relexai.dart';

class DatabaseServices{

  // lets create a constructor for uid(User Id)
  final String? uid;
  DatabaseServices([this.uid]);

  final CollectionReference relexai_collection= FirebaseFirestore.instance.collection("relexai_collection");
  // Here we will create a function so that we could update the  changes in the collection
  // we will use this 👇⬇ function whenever user signsIn.
  Future updateUserData(String sugar, String name, int strength) async{
    return await relexai_collection.doc(uid).set({
      "sugar": sugar,
      "name" : name,
      "strength": strength
    });
  }
  //
  List<Relexais> _relexaiListFromSnapShot(QuerySnapshot snapshot){
  return snapshot.docs.map((doc){
    return Relexais(
      doc['name'] ?? '',
      doc['sugar'] ?? '0',
      doc['strength'] ?? 0
    );
  }).toList();
}
  // we need to specify Stream so that we could notify the changes to the home screen.
  Stream<List<Relexais>> get relexai{
    return relexai_collection.snapshots()
    .map(_relexaiListFromSnapShot);
  }
}