// import 'package:careerdisha/screens/changepassword.dart';
import 'package:careerdisha/screens/changepassword.dart';
import 'package:careerdisha/screens/guestvideo.dart';
import 'package:careerdisha/screens/signupnew.dart';
import 'package:careerdisha/services/auth.dart';
import 'package:careerdisha/shared/loading.dart';
import 'package:flutter/material.dart';
//import 'package:careerdisha/screens/guestvideo.dart';

class LoginNew extends StatefulWidget {
  final Function toggleView;

  LoginNew({this.toggleView()});

  @override
  _LoginNewState createState() => new _LoginNewState();
}

class _LoginNewState extends State<LoginNew> {
  final _formkey = GlobalKey<FormState>();

  bool loading = false;
  bool _secure = true;

  void _togglevisibility() {
    setState(() {
      _secure = !_secure;
    });
  }

  String option;

  void togglePage(String toggle) {
    print("abc");
    setState(() {
      return option = toggle;
    });
  }

  final AuthService _auth = AuthService();

  //text filled state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    if (option == "video") {
      return Video();
    } else if (option == "register") {
      print("register");
      return SignupPage();
    } else if (option == "forgot") {
      print("forgotpassword");
      return PassReset();
    } else {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Color.fromRGBO(58, 66, 86, 1.0),
          accentColor: Colors.yellow[700],
        ),
        home: loading
            ? Loading()
            : Scaffold(
                backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
                body: ListView(
                  children: <Widget>[
                    Container(
                      child: Stack(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.fromLTRB(15.0, 50.0, 0.0, 0.0),
                            child: Text('Career',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 80.0,
                                    fontWeight: FontWeight.bold)),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(16.0, 135.0, 0.0, 0.0),
                      child: Text('দিশা',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 75.0,
                                    fontWeight: FontWeight.bold)),
                    ),
                    Container(
                      padding:
                                EdgeInsets.fromLTRB(165.0, 120.0, 0.0, 0.0),
                            child: Text('.',
                                style: TextStyle(
                                    fontSize: 90.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.yellowAccent[400])),
                          )
                  ],
                ),
              ),
              Container(
                  padding:
                  EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                  child: Form(
                    key: _formkey,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          style: TextStyle(color: Colors.white),
                          validator: (val) {
                            Pattern pattern =
                                r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                            RegExp regex = new RegExp(pattern);
                            if (val.isEmpty || !regex.hasMatch(val)) {
                              return 'Please insert valid Email-Id';
                            } else {
                              return null;
                            }
                          },
                          onChanged: (val) {
                            setState(() => email = val);
                          },
                          decoration: InputDecoration(
                            errorBorder: UnderlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Colors.deepOrangeAccent)),
                              errorStyle:
                              TextStyle(fontFamily: 'Comfortaa', color:Colors.deepOrangeAccent),
                              labelText: 'Email',
                              labelStyle: TextStyle(
                                  fontFamily: 'Comfortaa',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.yellow[400]),
                                  enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Colors.white)),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Colors.yellowAccent[400]))),
                        ),
                        SizedBox(height: 20.0),
                        TextFormField(
                          style: TextStyle(color: Colors.white),
                          validator: (val) {
                            if (val.isEmpty && val.length < 6) {
                              return 'Please enter Password of min 6 Character';
                            }
                            return null;
                          },
                          onChanged: (val) {
                            setState(() => password = val);
                          },
                          decoration: InputDecoration(
                              errorBorder: UnderlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Colors.deepOrangeAccent)),
                              errorStyle:
                              TextStyle(fontFamily: 'Comfortaa', color:Colors.deepOrangeAccent),
                              suffixIcon: IconButton(
                                onPressed: _togglevisibility,
                                icon: _secure == false
                                    ? Icon(Icons.visibility)
                                    : Icon(Icons.visibility_off),
                                color: Colors.white,
                              ),
                              labelText: 'Password',
                              labelStyle: TextStyle(
                                  fontFamily: 'Comfortaa',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.yellow[400]),
                                  enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Colors.white)),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Colors.yellow[600]))),
                          obscureText: _secure,
                        ),

                        SizedBox(height: 5.0),

                        Container(
                          alignment: Alignment(1.0, 0.0),
                          padding: EdgeInsets.only(top: 15.0, left: 20.0),
                          child: InkWell(
                            onTap: () {
                              togglePage("forgot");
                            },
                            child: Text(
                              'Forgot Password',
                              style: TextStyle(
                                  color: Colors.yellow[400],
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Comfortaa',
                                  decoration: TextDecoration.underline),
                            ),
                          ),
                        ),
                        SizedBox(height: 40.0),
                        Container(
                          height: 40.0,
                          child: Material(
                            borderRadius: BorderRadius.circular(20.0),
                            shadowColor: Colors.yellowAccent,
                            color: Colors.yellow[400],
                            elevation: 7.0,
                            child: InkWell(
                              onTap: () async {
                                if (_formkey.currentState.validate()) {
                                  setState(() {
                                    loading = true;
                                  });
                                  dynamic result = await _auth
                                      .signInWithEmailAndPassword(
                                      email, password);
                                  if (result == null) {
                                    setState(() {
                                      error =
                                      'Please enter valid details';
                                      loading = false;
                                    });
                                  }
                                }
                              },
                              child: Center(
                                child: Text(
                                  'SIGN IN',
                                  style: TextStyle(
                                      color: Color.fromRGBO(58, 66, 86, 1.0),
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Montserrat'),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.only(top: 20.0),
                            child: FlatButton(
                              onPressed: () {
                                togglePage("video");
                                // runApp(Video());
                              },
                              child: Text(
                                'TAKE A TOUR ?',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontFamily: 'Montserrat',
                                  letterSpacing: 3,
                                  color: Colors.yellowAccent[400],
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )),
                      ],
                    ),
                  )),
              SizedBox(height: 15.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'New to Carrerদিশা ?',
                    style: TextStyle(
                        fontFamily: 'Montserrat', color: Colors.white),
                  ),
                  SizedBox(width: 5.0),
                  InkWell(
                    onTap: () {
                      togglePage("register");
                      // widget.toggleView();
                      // runApp(Register());
                      print('register button pressed');
                    },
                    child: Text(
                      'Register',
                      style: TextStyle(
                          color: Colors.yellowAccent[400],
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      );
    }
  }
}
