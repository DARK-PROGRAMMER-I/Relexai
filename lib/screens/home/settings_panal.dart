

import 'package:flutter/material.dart';
import 'package:relexai/shared/constants.dart';

class SettingsPanal extends StatefulWidget {


  @override
  _SettingsPanalState createState() => _SettingsPanalState();
}

class _SettingsPanalState extends State<SettingsPanal> {
  final List<String> sugars= ['1', '2', '3', '4'];
  // Intentiate Global Form Key
  final _formkey= GlobalKey<FormState>();

  String? _changeSugar;
  String? _changeName;
  int? _changeStrength;



  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text('Update Your Data', style: TextStyle(color: Colors.black87, fontSize: 19),),
          SizedBox(height: 20,),
          // Name Field
          TextFormField(
            decoration: input_decoration_textField("Name"),
            validator: (value) => value!.isEmpty ? "Please Enter Valid Name ": null,
            onChanged: (value) => setState(()=> _changeName = value)
          ),
          SizedBox(height: 20,),
          //Sugars List
          DropdownButtonFormField(
            decoration: input_decoration_textField('Sugars'),
              items: sugars.map((sugar){
                return DropdownMenuItem(
                    value: sugar,
                    child: Text('$sugar sugars'),
                  );
              }).toList(),
              onChanged: (val)=> setState(()=> _changeSugar= val as String),
          ),

          // Slide Bar for Strength
          // Update Button
          SizedBox(height: 20,),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                side: BorderSide(color: Colors.black87),
                primary: Colors.greenAccent[100],
                padding: EdgeInsets.symmetric(horizontal: 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
                ),
                elevation: 10
                ),
              onPressed: ()async {
                print(_changeSugar);
                print(_changeName);
                print(_changeStrength);
              },
              child:Text("Save", style: TextStyle(color: Colors.black87),)


          )


          ]
      ),
    );
  }
}
