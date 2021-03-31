import 'package:flutter/material.dart';

class ChangeScreen extends StatelessWidget{

  final String name;
  final Function onTap;
  final String whitcAccount;
  ChangeScreen(
      {
        this.name,
        this.onTap,
        this.whitcAccount
      }
  );

  @override
  Widget build(BuildContext context) {

    return Row(
      children:<Widget>  [
        Text(whitcAccount),
        SizedBox(
          width: 10,
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            name,
            style: TextStyle(
                color: Colors.cyan,
                fontSize: 20,
                fontWeight: FontWeight.bold
            ),
          ),
        )
      ],
    );


  }

}