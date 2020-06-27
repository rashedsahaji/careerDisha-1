import 'package:careerdisha/screens/loginnew.dart';
import 'package:careerdisha/services/auth.dart';
import 'package:careerdisha/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:otp/otp.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

class SignupPage extends StatefulWidget {
  final Function toggleView;
  SignupPage({this.toggleView});

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formkey = GlobalKey<FormState>();
  final _otpkey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController cpasswordController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  bool loading = false;

  final AuthService _auth = AuthService();

  //text filled state
  String email = '';
  String password = '';
  String confirmpassword = '';
  String name = '';
  String age='';
  String phone = '';
  String error = '';
  String code='';
  String otp='';

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
                body: ListView(
                  children: <Widget>[
                    Container(
                      child: Stack(
                        children: <Widget>[
                          Container
                      (
                      padding: EdgeInsets.fromLTRB(15.0, 50.0, 0.0, 0.0),
                      child: Text
                        (
                        'Sign up',
                        style: TextStyle
                          (
                            color: Colors.white,
                            fontSize: 80.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(280.0, 55.0, 0.0, 0.0),
                      child: Text(
                        '.',
                        style: TextStyle(
                            fontSize: 90.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.yellow[400]),
                      ),
                    )
                  ],
                ),
              ),
              Container
                (
                padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                child: Form
                  (
                  key: _formkey,
                  child: Column
                    (
                    children: <Widget>
                    [
                      TextFormField
                        (
                        style: TextStyle(color: Colors.white),
                              controller: nameController,
                              validator: (val) {
                                Pattern pattern =
                                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))_(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))$';
                                RegExp regex = new RegExp(pattern);
                                if (val.isEmpty || !regex.hasMatch(val)) {
                                  return 'Please insert valid name e.g John_Doe';
                                } else {
                                  return null;
                                }
                              },
                        onChanged: (val) {
                          setState(() => name = val);
                        },
                        keyboardType: TextInputType.text,
                        cursorColor: Colors.yellowAccent[700],
                        decoration: InputDecoration
                          (
                            enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Colors.white)),
                            errorBorder: UnderlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Colors.deepOrangeAccent)),
                              errorStyle:
                              TextStyle(fontFamily: 'Comfortaa', color:Colors.deepOrangeAccent),
                            labelText: 'Enter Full Name e.g.John_Doe ',
                            labelStyle: TextStyle
                              (
                                fontFamily: 'Comfortaa',
                                fontWeight: FontWeight.bold,
                                color: Colors.yellow[400]
                            ),
                            focusedBorder: UnderlineInputBorder
                              (
                                borderSide: BorderSide(
                                    color: Colors.yellow[600])
                            )
                        ),
                      ),

                      SizedBox(height: 5.0),

                      TextFormField
                        (
                        style: TextStyle(color: Colors.white),
                        controller: ageController,
                        validator: (val) {
                          if (val.isEmpty || int.parse(val) < 21 || int.parse(
                              val) > 39) {
                            return 'Please insert valid age';
                          }
                          else {
                            return null;
                          }
                        },
                        onChanged: (val) {
                          setState(() => age = val);
                        },
                        keyboardType: TextInputType.number,
                        cursorColor: Colors.yellow[700],
                        decoration: InputDecoration
                          (
                            enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Colors.white)),
                            errorBorder: UnderlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Colors.deepOrangeAccent)),
                              errorStyle:
                              TextStyle(fontFamily: 'Comfortaa', color:Colors.deepOrangeAccent),
                            labelText: 'Enter age (21-39)',
                            labelStyle: TextStyle
                              (
                                fontFamily: 'Comfortaa',
                                fontWeight: FontWeight.bold,
                                color: Colors.yellow[400]
                            ),
                            focusedBorder: UnderlineInputBorder
                              (
                                borderSide: BorderSide(
                                    color: Colors.yellow[600])
                            )
                        ),
                      ),

                      SizedBox(height: 5.0),

                      TextFormField
                        (
                        style: TextStyle(color: Colors.white),
                        controller: phoneController,
                        validator: (val) {
                          if (val.isEmpty || int.parse(val) < 10) {
                            return 'Please insert valid phone number';
                          }
                          else {
                            return null;
                          }
                        },
                        onChanged: (val) {
                          setState(() => phone = val);
                        },
                        keyboardType: TextInputType.number,
                        cursorColor: Colors.yellowAccent[700],
                        decoration: InputDecoration
                          (
                            enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Colors.white)),
                            errorBorder: UnderlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Colors.deepOrangeAccent)),
                              errorStyle:
                              TextStyle(fontFamily: 'Comfortaa', color:Colors.deepOrangeAccent),
                            labelText: 'Enter Phone',
                            labelStyle: TextStyle
                              (
                                fontFamily: 'Comfortaa',
                                fontWeight: FontWeight.bold,
                                color: Colors.yellow[400]
                            ),
                            focusedBorder: UnderlineInputBorder
                              (
                                borderSide: BorderSide(
                                    color: Colors.yellow[600])
                            )
                        ),
                      ),

                      SizedBox(height: 5.0),

                      TextFormField
                        (
                        style: TextStyle(color: Colors.white),
                        controller: emailController,
                        validator: (val) {
                          Pattern pattern =
                              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                          RegExp regex = new RegExp(pattern);
                          if (val.isEmpty || !regex.hasMatch(val)) {
                            return 'Please insert valid Email-Id';
                          }
                          else {
                            return null;
                          }
                        },
                        onChanged: (val) {
                          setState(() => email = val);
                        },
                        cursorColor: Colors.yellowAccent[700],
                        decoration: InputDecoration
                          (
                            enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Colors.white)),
                            errorBorder: UnderlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Colors.deepOrangeAccent)),
                              errorStyle:
                              TextStyle(fontFamily: 'Comfortaa', color:Colors.deepOrangeAccent),
                            labelText: 'Email',
                            labelStyle: TextStyle
                              (
                                fontFamily: 'Comfortaa',
                                fontWeight: FontWeight.bold,
                                color: Colors.yellow[400]
                            ),
                            focusedBorder: UnderlineInputBorder
                              (
                                borderSide: BorderSide(
                                    color: Colors.yellow[600])
                            )
                        ),
                      ),

                      SizedBox(height: 5.0),

                      TextFormField
                        (
                        style: TextStyle(color: Colors.white),
                        controller: passwordController,
                        validator: (val) {
                          if (val.isEmpty && val.length < 6) {
                            return 'Please enter Password of minimum 6 Characters';
                          }
                          else {
                            return null;
                          }
                        },
                        onChanged: (val) {
                          setState(() => password = val);
                        },
                        cursorColor: Colors.yellowAccent[700],
                        decoration: InputDecoration
                          (
                            enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Colors.white)),
                            errorBorder: UnderlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Colors.deepOrangeAccent)),
                              errorStyle:
                              TextStyle(fontFamily: 'Comfortaa', color:Colors.deepOrangeAccent),
                            labelText: 'Password ',
                            labelStyle: TextStyle
                              (
                                fontFamily: 'Comfortaa',
                                fontWeight: FontWeight.bold,
                                color: Colors.yellow[400]
                            ),
                            focusedBorder: UnderlineInputBorder
                              (
                                borderSide: BorderSide(
                                    color: Colors.yellow[600])
                            )
                        ),
                        obscureText: true,
                      ),

                      SizedBox(height: 5.0),

                      TextFormField
                        (
                        style: TextStyle(color: Colors.white),
                        controller: cpasswordController,
                        validator: (val) {
                          if (passwordController.text != cpasswordController
                              .text || cpasswordController
                              .text=='') {
                            return "Password didn't match";
                          }
                          else {
                            return null;
                          }
                        },
                        onChanged: (val) {
                          setState(() => confirmpassword = val);
                        },
                        cursorColor: Colors.yellowAccent[700],
                        decoration: InputDecoration
                          (
                            enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Colors.white)),
                            errorBorder: UnderlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Colors.deepOrangeAccent)),
                              errorStyle:
                              TextStyle(fontFamily: 'Comfortaa', color:Colors.deepOrangeAccent),
                            labelText: 'Confirm Password ',
                            labelStyle: TextStyle
                              (
                                fontFamily: 'Comfortaa',
                                fontWeight: FontWeight.bold,
                                color: Colors.yellow[400]
                            ),
                            focusedBorder: UnderlineInputBorder
                              (
                                borderSide: BorderSide(
                                    color: Colors.yellow[600])
                            )
                        ),
                        obscureText: true,
                      ),

                      SizedBox(height: 40.0),

                      Container
                        (
                          height: 40.0,
                          child: Material
                            (
                            borderRadius: BorderRadius.circular(20.0),
                            shadowColor: Colors.yellowAccent,
                            color: Colors.yellow[400],
                            elevation: 7.0,
                            child: InkWell
                              (
                              onTap: () async
                              {
                                if (_formkey.currentState.validate()) 
                                {
                                  otpstate(context);
                                  emailid(context);
                                  clear();
                                }
                              },
                              child: Center
                                (
                                child: Text
                                  (
                                  'SIGN UP',
                                  style: TextStyle
                                    (
                                      color: Color.fromRGBO(58, 66, 86, 1.0),
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Montserrat'
                                  ),
                                ),
                              ),
                            ),
                          )
                      ),

                      SizedBox(height: 20.0),

                      Container
                        (
                        height: 40.0,
                        color: Colors.transparent,
                        child: Container
                          (
                          decoration: BoxDecoration
                            (
                              border: Border.all
                                (
                                  color: Colors.yellow,
                                  style: BorderStyle.solid,
                                  width: 1.0
                              ),
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(20.0)
                          ),
                          child: InkWell
                            (
                            onTap: () {
                              togglePage("login");
                              print('login button pressed');
                            },
                            child: Center
                              (
                              child: Text
                                (
                                  'Go Back to Login Page',
                                  style: TextStyle
                                    (
                                      color: Colors.yellow[400],
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Montserrat'
                                  )
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 50.0,),
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
  clear()
  {
    nameController.text='';
    ageController.text='';
    phoneController.text='';
    passwordController.text='';
    cpasswordController.text='';
    otpController.text='';
  }

  otpstate(BuildContext context)
  {
    code = OTP.generateTOTPCodeString('JBSWY3DPEHPK3PXP', DateTime.now().millisecondsSinceEpoch, interval: 10);
    print(code);
    _showDialog(context);
  }

  Future<void> _showDialog(BuildContext context) 
  {
    return showDialog(
        context: context,
        builder: (BuildContext context) 
        {
          return AlertDialog
          (
            title: Text("Enter OTP"),
            content: SingleChildScrollView
            (
              child: ListBody
              (
                children: <Widget>
                [
                  Padding(padding: EdgeInsets.all(8.0)),

                  Form
                  (
                    key: _otpkey,
                    child:Column
                    (
                      children:<Widget>
                      [ 
                        TextFormField
                        (
                          keyboardType: TextInputType.number,
                          controller: otpController,
                          validator: (val) 
                          {
                            if (val.isEmpty && val.length < 6) 
                            {
                              return 'Please enter OTP';
                            }
                            else if(code!=otpController.text)
                            {
                              return 'Try again';
                            }
                            else 
                            {
                              return null;
                            }
                          },
                          onChanged: (val) 
                          {
                            setState(() => otp = val);
                          },
                          cursorColor: Colors.tealAccent[700],
                          decoration: InputDecoration
                          (
                            labelText: 'Enter OTP',
                            labelStyle: TextStyle
                            (
                              fontFamily: 'Comfortaa',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey
                            ),
                            focusedBorder: UnderlineInputBorder
                            (
                              borderSide: BorderSide(color: Colors.teal[600])
                            )
                          ),
                        ),

                        Padding(padding: EdgeInsets.all(10.0)),
                  
                        Container
                        (
                          height: 40.0,
                          child: Material
                            (
                            borderRadius: BorderRadius.circular(20.0),
                            shadowColor: Colors.yellowAccent,
                            color: Colors.yellow[400],
                            elevation: 7.0,
                            child: InkWell
                            (
                              onTap: () async
                              {
                                if (_otpkey.currentState.validate()) 
                                {
                                  Navigator.of(context).pop();
                                    print("welcome");
                                    setState(() => loading = true);
                                    dynamic result = await _auth.register(name, age, phone, email, password);
                                    if (result == null) 
                                    {
                                      setState(() {
                                          error = 'Please enter valid details';
                                          loading = false;
                                        });
                                    }
                                }

                               },
                               child: Center
                               (
                                child: Text
                                  (
                                  'SUBMIT',
                                  style: TextStyle
                                    (
                                      color: Color.fromRGBO(58, 66, 86, 1.0),
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Montserrat'
                                  ),
                                ),
                              ),
                            ),
                          )
                      ),
                    ],
                  )
                ),
              ],
            ),
          ),
        );
      }
    );
  }

  emailid(BuildContext context)async
  {
    String username = 'careerdishaindia2020@gmail.com';
    String password = '9432329948';
    final smtpServer = gmail(username, password);
    final message = Message()
    ..from = Address(username, 'CareerDisha')
    ..recipients.add(email)
    ..subject = 'Career Disha '
    ..html = "<h1>$code</h1> \n <h6> Your OTP is valid for 10 seconds</h6>";
    try 
    {
      final sendReport = await send(message, smtpServer);
      print('Message sent: ' + sendReport.toString());
    } 
    on MailerException catch (e) 
    {
      print('Message not sent.');
      for (var p in e.problems) 
      {
        print('Problem: ${p.code}: ${p.msg}');
      }
    }
    var connection = PersistentConnection(smtpServer);
    await connection.send(message);
    await connection.close();
  }
}