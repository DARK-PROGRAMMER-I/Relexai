import 'package:flutter/material.dart';
import 'package:relexai/models/relexai.dart';

class RelexTile extends StatelessWidget {
  final Relexais  relex;
  RelexTile(this.relex);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8),
      child: Card(
        margin: EdgeInsets.fromLTRB(20, 8, 20, 0),
        color: Colors.grey[900],
        child: ListTile(
          leading: CircleAvatar(
            radius: 25,
            backgroundColor: Colors.green[relex.strength],
          ),
          title: Text(relex.name, style: TextStyle(color: Colors.white70, fontSize: 22),),
          subtitle: Text("${relex.name} wants to add ${relex.sugar} amount of sugar ",
                                style: TextStyle(color: Colors.white60)),
          trailing: IconButton(
              onPressed: (){},
              icon: Icon(Icons.more_vert, size : 22),color: Colors.white),

        ),
      ),


    );
  }
}
