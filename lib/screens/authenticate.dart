import 'package:careerdisha/screens/loginnew.dart';
import 'package:careerdisha/screens/signupnew.dart';
// import 'image.dart';
//import 'package:careerdisha/screens/registerpage.dart';
// import 'package:careerdisha/screens/userinfo.dart';
import 'package:flutter/material.dart';
 class Authenticate extends StatefulWidget 
 {
   @override
   _AuthenticateState createState() => _AuthenticateState();
 }
 
 class _AuthenticateState extends State<Authenticate> 
 {
   bool showLogin = true;
   void toggleView()
   {
     setState(() 
     {
       return showLogin = !showLogin ;
     });
   }

   @override
   Widget build(BuildContext context) 
   {
      if(showLogin)
      {
        return LoginNew(toggleView : toggleView);
      }
      else
      {
        return SignupPage(toggleView : toggleView);
      }
   }
 }
 