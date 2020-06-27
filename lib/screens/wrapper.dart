import 'package:careerdisha/models/user.dart';
import 'package:careerdisha/screens/authenticate.dart';
import 'package:careerdisha/screens/navigator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    if(user==null){
      return Authenticate();
    }
    else {
      return Navigate();
    }
  }
}