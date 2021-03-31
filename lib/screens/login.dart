import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_e_com/screens/signup.dart';
import 'package:flutter_app_e_com/widgets/changescreen.dart';
import 'package:flutter_app_e_com/widgets/mybutton.dart';
import 'package:flutter_app_e_com/widgets/mytextformfield.dart';
import 'package:flutter_app_e_com/widgets/passwordtextformfield.dart';
class Login extends StatefulWidget {
  @override
   _LoginState createState() => _LoginState();
}
final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();

String p = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
RegExp regExp = new RegExp(p);
bool obserText=true;

String email;
String password;
void validation() async {
  final FormState _form = _formkey.currentState;
  if(!_form.validate()){
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password
      );
      print(userCredential.user.uid);
    } on FirebaseAuthException catch (e) {
      _scaffoldkey.currentState.showSnackBar(
          SnackBar(
            content: Text(e.message),
          )
      ) ;
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }
  else{
    print("No");
  }
}

class _LoginState extends State<Login>{


  Widget _buildAllPart(){
    return Container(
      child:Column(
        children: <Widget>[
          Container(
            height: 300,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:<Widget> [
                Text(
                  "Connexion",
                  style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold
                  ),
                ),

                MyTextFormField(
                  name: "Email",
                  onChanged: (value){
                    setState(() {
                      email =value ;
                    });
                  },
                  validator: (value){
                    if (!regExp.hasMatch(value)){
                      return "Email Non Valide";
                    }
                    else if(value ==""){
                      return "Veiller Entrez Un Email !";
                    }
                    return "";
                  },
                ),
                PasswordTextFormField(
                  name: "Mot de passe",
                  onChanged: (value){
                    setState(() {
                      password =value ;
                    });
                  },
                  obserText: obserText,
                  validator: (value){
                    if (value.length < 8){
                      return "Mot de Passe Trop Court";
                    }
                    else if(value ==""){
                      return "Veiller Entrez Un Mot de Passe!";
                    }
                    return "";
                  },
                  onTap: (){
                    setState(() {
                      obserText= !obserText;
                    });
                    FocusScope.of(context).unfocus();
                  },
                ),


                MyButton(
                  onPressed: (){
                    validation();
                  },
                  name: "Connexion",
                ),
                ChangeScreen(
                  whitcAccount:"Crée un  Compte!" ,
                  name: "Inscription",
                  onTap: (){
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (ctx)=>SignUp(),
                      ),
                    );
                  },
                ),


              ],
            ),
          ),
        ],
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      body: Form(
        key: _formkey,
        child:Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:<Widget> [
              _buildAllPart(),
            ],
          ),
      ),
      )
    );
  }


}

/*

  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}*/