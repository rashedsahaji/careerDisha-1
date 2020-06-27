import 'package:careerdisha/screens/loginnew.dart';
import 'package:careerdisha/services/auth.dart';
import 'package:careerdisha/shared/loading.dart';
import 'package:flutter/material.dart';

class PassReset extends StatefulWidget {
  final Function toggleView;
  PassReset({this.toggleView});

  @override
  _PassResetState createState() => _PassResetState();
}

class _PassResetState extends State<PassReset> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  bool loading = false;

  final AuthService _auth = AuthService();
  //text filled state
  String email = '';
  String error = '';

  String option;
  void togglePage(String toggle)
  {
    print("video page");
    setState(()
    {
      return option = toggle ;
    });
  }


  @override

  Widget build(BuildContext context)
  {
    if(option=="login")
    {
      return LoginNew();
    }
    else
    {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: Color.fromRGBO(58, 66, 86, 1.0),
            accentColor: Colors.yellow[700]),
        home: loading
            ? Loading()
            : Scaffold(
                backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
                resizeToAvoidBottomPadding: false,
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: Stack(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                            child: Text('Password',
                                style: TextStyle(
                              color: Colors.white,
                              fontSize: 70.0, fontWeight: FontWeight.bold)),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(16.0, 175.0, 0.0, 0.0),
                      child: Text('Reset',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 75.0, fontWeight: FontWeight.bold)),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(220.0, 175.0, 0.0, 0.0),
                      child: Text('.',
                          style: TextStyle(
                              fontSize: 80.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.yellow[400])),
                    )
                  ],
                ),
              ),
              Center(
                child: SizedBox(
                  width: 320,
                  child: Column(
                    children: <Widget>[
                      Divider(
                        thickness: 2,
                        color: Colors.yellow[400],
                      ),
                      Text('Reset Your Accounts Password',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Montserrat'
                        ),)
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                child: Form(
                  key: _formkey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        style: TextStyle(color: Colors.white),
                              controller: emailController,
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
                        cursorColor: Colors.yellow[700],
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Colors.white)),
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
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.yellow[600]))),
                      ),
                      SizedBox(height: 40.0),
                      Container(
                          height: 40.0,
                          child: Material(
                            borderRadius: BorderRadius.circular(20.0),
                            shadowColor: Colors.yellowAccent[400],
                            color: Colors.yellow[400],
                            elevation: 7.0,
                            child: InkWell(
                              onTap: () async {
                                if (_formkey.currentState.validate()) {
                                  setState(() {
                                    loading = true;
                                  });
                                  dynamic result = await _auth.searchEmail(
                                      email);
                                  if(result==null) {
                                    setState(() {
                                      error ='Please enter valid details';
                                      loading = false;
                                    });
                                  }
                                  else if(result!=null) {
                                    setState(() {
                                      print("Please check mail for Password link");
                                      error ='Please check mail for Password link';
                                      loading=false;
                                      // customLaunch('https://gmail.com/inbox');
                                    });
                                  }
                                }},
                              child: Center(
                                child: Text(
                                  'SEND PASSWORD RESET MAIL',
                                  style: TextStyle(
                                      color: Color.fromRGBO(58, 66, 86, 1.0),
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Montserrat'),
                                ),
                              ),
                            ),
                          )),
                      SizedBox(height: 20.0),
                      Container(
                        height: 40.0,
                        color: Colors.transparent,
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.yellow,
                                  style: BorderStyle.solid,
                                  width: 1.0),
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(20.0)),
                          child: InkWell(
                            onTap: () {
                              togglePage("login");
                              print('login button pressed');
                            },
                            child: Center(
                              child: Text('Go Back to Login Page',
                                  style: TextStyle(
                                      color: Colors.yellow,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Montserrat')),
                            ),
                          ),
                        ),
                      ),
                      Text(error, style: TextStyle(color: Colors.red, fontSize: 14),),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}
