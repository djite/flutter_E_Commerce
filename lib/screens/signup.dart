import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_e_com/screens/login.dart';
import 'package:flutter_app_e_com/widgets/changescreen.dart';
import 'package:flutter_app_e_com/widgets/mybutton.dart';
import 'package:flutter_app_e_com/widgets/passwordtextformfield.dart';
import 'package:flutter_app_e_com/widgets/mytextformfield.dart';

import 'package:firebase_auth/firebase_auth.dart';



class SignUp extends StatefulWidget {
  @override
  _SignUpState  createState() => _SignUpState();
}

final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();

String p = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
RegExp regExp = new RegExp(p);

bool obserText=true;

String email;
String password;

class _SignUpState extends State<SignUp>{

  void validation() async{
    final FormState _form = _formkey.currentState;
    if(!_form.validate()){

      try {
        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
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
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
        }
      } catch (e) {
        print(e);
      }

    }
    else{
      print("No");
    }
  }
  Widget _buildAllTextFormField(){
    return Container(
        height: 330,
        width: double.infinity,
        child:Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            MyTextFormField(
              name: "Nom d'utilisateur",
              validator: (value){
                if (value.length < 6){
                  return "Nom d'utilisateur Trop Court";
                }
                else if(value ==""){
                  return "Veiller Entrez Un Nom d'utilidsateur !";
                }
                return "";
              },
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
                  password = value ;
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
            MyTextFormField(
              name: "Telephone",
              validator: (value){
                if (value.length < 9){
                  return "Le Numero  doit Contenir 9 chiffre";
                }
                else if(value ==""){
                  return "Veiller Entrez Un Numero de Telephone !";
                }
                return "";
              },
            ),
          ],
        )
    );
  }

  Widget _buildBottonPart(){
    return Container(
      height: 400,
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: double.infinity,
      child: Column(

        children:<Widget> [


          _buildAllTextFormField(),

          MyButton(
            onPressed: (){
              validation();
            },
            name: "Inscription",
          ),

          ChangeScreen(
            whitcAccount:"J'ai déjà un Compte!!" ,
            name: "Connexion",
            onTap: (){
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (ctx)=>Login(),
                ),
              );
            },
          ),



        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Form(
          key: _formkey,
          child: Column(
            children:<Widget> [

              Container(
                height: 220,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children:<Widget> [
                    Text(
                      "S'Inscrire",
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),

              SizedBox(
                height: 20,
              ),

              _buildBottonPart(),
            ],
          ),
        ),

      ),
    );
  }

}