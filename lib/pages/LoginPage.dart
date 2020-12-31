import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/services.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //TextEditingController nameController=TextEditingController();

  TextEditingController _emailController=TextEditingController();
  TextEditingController _passwordController=TextEditingController();
FirebaseAuth _firebaseAuth=FirebaseAuth.instance;
GlobalKey<ScaffoldState> _scaffoldkey=GlobalKey<ScaffoldState>();

_login() async{
  try{
  FirebaseUser _user = await _firebaseAuth.signInWithEmailAndPassword(email: _emailController.text.trim(), password: _passwordController.text.trim());
  _scaffoldkey.currentState.showSnackBar(SnackBar(content: Text("Login successful")));

  }
  catch(ex){
    _scaffoldkey.currentState.showSnackBar(SnackBar(content: Text((ex as PlatformException).message)));
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,

    resizeToAvoidBottomPadding: false,
     // backgroundColor: Colors.black,
        body: Container(
         padding: EdgeInsets.symmetric(vertical: 65),
          width: double.infinity,

    decoration: BoxDecoration(
      gradient: LinearGradient(
       begin: Alignment.topCenter,
        colors: [
          Colors.orange[900],
          Colors.orange[800],
          Colors.white,
        ]
      )
    ),
child: Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: <Widget>[
    SizedBox(height: 50,),
    Padding(padding: EdgeInsets.all(20),
    child: Column(
      crossAxisAlignment : CrossAxisAlignment.start,
      children: <Widget>[
       Text("Login",style: TextStyle(color: Colors.white,fontSize: 40),),
        SizedBox(height: 10,),
        Text("Welcome Back",style: TextStyle(color: Colors.white,fontSize: 20),)
      ],
    ),),
SizedBox(height: 20,),
Expanded(
  child: Container(
    decoration: BoxDecoration(
    color: Colors.white,
      borderRadius: BorderRadius.only(topLeft: Radius.circular(60),topRight: Radius.circular(60))),
        child:Padding(
      padding: EdgeInsets.all(15),
          child: Column(
            children: <Widget>[
              SizedBox(height: 45,),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow:[BoxShadow(
                    color: Color.fromRGBO(225, 95, 27, .3),
                    blurRadius: 20,
                    offset: Offset(0,10)
                  )]
                ),


                child: Column(
                  children: <Widget>[


                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(color: Colors.grey[200]))
                      ),
                      child: TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          hintText: "Enter your Email",
                          hintStyle: TextStyle(color: Colors.grey),
                          border:InputBorder.none
                        ),
                      ),
                    ),






                    Container(
                      padding: EdgeInsets.all(9),
                      decoration: BoxDecoration(
                          border: Border(bottom: BorderSide(color: Colors.grey[200]))
                      ),
                      child: TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(

                            hintText: "Password",
                            hintStyle: TextStyle(color: Colors.grey),
                            border:InputBorder.none
                        ),
                      ),
                    )






                  ],
                ),
              ),

              SizedBox(height:25,),
              Text("Forgot Password?", style: TextStyle(color: Colors.grey,fontSize: 15),),
              SizedBox(height: 20,),
              Container(
                height: 50,
                margin: EdgeInsets.symmetric(horizontal: 50),
                decoration: BoxDecoration(

                  borderRadius: BorderRadius.circular(50),
                  color: Colors.orange[900]
                ),
                child: FlatButton(

                  child: Text("                Login                 ",style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.bold),),
                onPressed: (){
                    _login();
                },
                ),
              ),


              SizedBox(height: 15,),
              Container(
                height: 50,
                margin: EdgeInsets.symmetric(horizontal: 80),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.red[500]
                ),
                child: Center(
                  child: Text("Signup",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
                ),
              ),



            ],
          )
  ),
  ),




)
  ],
),

        ),

    );

  }
}
