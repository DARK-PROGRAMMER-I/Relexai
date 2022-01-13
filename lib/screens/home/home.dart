import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:relexai/auth_services/authServices.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  // Instentiate the AutheService Class here
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              label: Text("Signout", style: TextStyle(color: Colors.black87, fontSize: 17),))
        ],

      ),
    );
  }
}
