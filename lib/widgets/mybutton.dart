import 'package:flutter/material.dart';

class MyButton extends StatelessWidget{

  Function onPressed;
  final String name;
  MyButton(
      {
        this.name,
        this.onPressed
      }
  );
  @override
  Widget build(BuildContext context) {

    return Container(
      height: 45,
      width: double.infinity,
      child: RaisedButton(
        child: Text(name),
        color: Colors.lightGreenAccent,
        onPressed:onPressed ,
      ),
    );


  }
  
}