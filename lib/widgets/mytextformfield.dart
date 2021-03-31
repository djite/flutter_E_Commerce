import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class MyTextFormField  extends StatelessWidget{

  final Function validator;
  final String name;
  final Function onChanged;

  MyTextFormField(
      {
        this.validator,
        this.name,
        this.onChanged


      }
      );
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator:validator,
      onChanged:onChanged ,
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText:name ,
          hintStyle:TextStyle(
              color: Colors.black
          )
      ),
    );
  }
  
}