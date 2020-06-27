import 'package:careerdisha/screens/loginnew.dart';
import 'package:careerdisha/services/auth.dart';
import 'package:flutter/cupertino.dart';

class Logout extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    _auth.signOut();
    return LoginNew();
  }
}
