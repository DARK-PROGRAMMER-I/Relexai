import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:relexai/models/relexai.dart';
import 'package:relexai/screens/home/relex_tile.dart';

class Relexai_list extends StatefulWidget {
  const Relexai_list({Key? key}) : super(key: key);

  @override
  _Relexai_listState createState() => _Relexai_listState();
}

class _Relexai_listState extends State<Relexai_list> {



  @override

  Widget build(BuildContext context) {
    // Here we will initiallize the Provider object
    late final relexais=  Provider.of<List<Relexais>>(context);

    // for(var doc in relexais.docs){
    //   print(doc.data());
    // }
    // So instead of doing this, we need to make a list of each collection.

    return ListView.builder(
        itemCount: relexais.length,
        itemBuilder: (context, index){
          return RelexTile(relexais[index]);
        });
  }
}
