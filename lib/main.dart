import 'package:careerdisha/models/user.dart';
import 'package:careerdisha/screens/wrapper.dart';
import 'package:careerdisha/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        title: 'Careerদিশা',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Color.fromRGBO(58, 66, 86, 1.0), 
          fontFamily: 'Raleway',
          accentColor: Colors.yellowAccent,
        ),
        home: Wrapper(),
      ),
    );
  }
}
