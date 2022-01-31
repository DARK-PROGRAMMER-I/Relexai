import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:relexai/auth_services/authServices.dart';
import 'package:relexai/auth_services/database.dart';
import 'package:relexai/models/relexai.dart';
import 'package:relexai/screens/home/relexai_list.dart';
import 'package:relexai/screens/home/settings_panal.dart';


class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  // Instentiate the AutheService Class here
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Relexais>?>.value(
      initialData: null,
      value: DatabaseServices().relexai,
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: Colors.greenAccent[100],
          elevation: 0.4,
          title: Container(
              child: Row(
                children: [
                  // Padding(padding: EdgeInsets.symmetric(horizontal: 20)),
                  Icon(Icons.home , color: Colors.black87,),
                  SizedBox(
                    width: 9,
                  ),
                  Text(" Relexai", style: TextStyle(color: Colors.black87, fontSize: 17),)
                ],
              ),


          ),

          actions: <Widget>[
            TextButton.icon(
                onPressed: () async{
                  await _auth.signOut();
                },
                icon: Icon(Icons.person, color: Colors.black87 ,),
                label: Text("Signout", style: TextStyle(color: Colors.black87, fontSize: 17),)),
            TextButton.icon(
                onPressed: (){
                  _showSettingPanal(context);
                },
                icon: Icon(Icons.settings, color: Colors.black87),
                label: Text("Settings",style: TextStyle(color: Colors.black87, fontSize: 17) ),
            )
          ],

        ),

        body: Relexai_list(),
      ),
    );
  }
  void _showSettingPanal(BuildContext context){
      showModalBottomSheet(
          context: context,
          builder: (context){
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 60, vertical: 20),

                child: SettingsPanal(),

            );
          });
  }
}
