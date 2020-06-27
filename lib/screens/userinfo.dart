import 'dart:io';
import 'package:careerdisha/models/user.dart';
import 'package:careerdisha/screens/changepassword.dart';
import 'package:careerdisha/services/auth.dart';
import 'package:careerdisha/services/database.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';

class UserInfo extends StatefulWidget {
  @override
  _UserInfoState createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  var _formkey = GlobalKey<FormState>(); // Global key declaration

  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  bool loading = false;

  File imageFile;

  final AuthService _auth = AuthService();
  final userdata = '';

  String password = '';
  String email = '';
  String age = '';
  String phone = '';
  String name = '';
  String error = '';
  String url='';
  bool _fetching = true;

  String option;

  void togglePage(String toggle) {
    print("abc");
    setState(() {
      return option = toggle;
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    if (option == "forgot") {
      return PassReset();
    } else {
      return StreamBuilder<UserData>(
          stream: DatabaseService(userid: user.uid).users,
          builder: (context, snapshot) {
            if (snapshot.hasData) 
            {
              UserData userdata = snapshot.data;
              phone = userdata.phone;
              age = userdata.age;
              name = userdata.name;
              email = userdata.email;
              password = userdata.password;
              _fetching=false;
              if(url=='')
              {
                url=userdata.url;
              }
            } 
            return Scaffold(
                    appBar: AppBar(
                    //   title: Text('User Info'),
                      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
                    
                    title: Text(
                      _fetching ? 'Loading...' : 'User Info',
                      style: TextStyle(fontFamily: 'Montserrat'),
                    )
                    ),
                    body: SafeArea(
                      child: Container(
                        child: ListView(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 0),
                              child: Column(
                                children: <Widget>[
                                  Column(
                                    children: <Widget>[
                                Container(
                                  // color:Colors.red,
                                  height: 175,
                                  width: 300,
                                  child: Center(
                                    child: CircleAvatar(
                                      radius: 80,
                                      backgroundColor: Color.fromRGBO(
                                          58, 66, 86, 1.0),
                                      child: ClipOval(
                                        child: new SizedBox(
                                          width: 180.0,
                                          height: 180.0,
                                          child: url==''?Image.network("https://i.imgur.com/SmXxb6D.png",fit: BoxFit.fill,):Image.network(url,fit: BoxFit.fill,),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            IconButton(
                              icon: Icon(Icons.camera_alt),
                              onPressed: () {
                                _showChoiceDialog(context);
                              },
                              color: Color.fromRGBO(58, 66, 86, 1.0),
                              iconSize: 30,
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              'User Info',
                              style: TextStyle(
                                  fontSize: 20, fontFamily: 'Comfortaa'),
                            ),
                          ],
                        ),
                      ),
                      Form(
                        child: Container(
                            padding: EdgeInsets.only(
                                left: 20, bottom: 20, right: 20, top: 30),
                            // color:Colors.red,
                            constraints: BoxConstraints.expand(
                                height: MediaQuery
                                    .of(context)
                                    .size
                                    .height -
                                    280),
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(58, 66, 86, 1.0),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30)),
                            ),
                            child: Form(
                                key: _formkey,
                                child: Column(
                                  children: <Widget>[
                                    TextFormField(
                                      style:TextStyle(color: Colors.white),
                                            controller: nameController,
                                            validator: (val) {
                                              Pattern pattern =
                                                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))_(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))$';
                                              RegExp regex =
                                                  new RegExp(pattern);
                                              if (val.isNotEmpty) {
                                                if (!regex.hasMatch(val)) {
                                                  return 'Please insert valid name e.g John_Doe';
                                                } else {
                                                  name = nameController.text;
                                                  return null;
                                          }
                                        } else {
                                          return null;
                                        }
                                      },
                                      decoration: InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.white,
                                              width: 2),
                                        ),
                                        hintText: name,
                                        contentPadding: EdgeInsets.all(5.0),
                                        hintStyle: TextStyle(
                                            fontFamily: 'Comfortaa',
                                            color: Colors.white),
                                        errorStyle: TextStyle(
                                            fontFamily: 'Comfortaa'),
                                        icon: Padding(
                                          padding:
                                          EdgeInsets.only(left: 5.0),
                                          child: Icon(
                                            Icons.person,
                                            color: Colors.white,
                                            size: 28,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    TextFormField(
                                      style: TextStyle(color: Colors.white),
                                      controller: ageController,
                                      keyboardType: TextInputType.number,
                                      validator: (val) {
                                        if (val.isNotEmpty) {
                                          if (int.parse(val) < 21 ||
                                              int.parse(val) > 28) {
                                            return 'Please insert valid age (21-28)';
                                          } else {
                                            age = ageController.text;
                                            return null;
                                          }
                                        } else {
                                          return null;
                                        }
                                      },
                                      decoration: InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.white,
                                              width: 2),
                                        ),
                                        hintText: age,
                                        contentPadding: EdgeInsets.all(5.0),
                                        hintStyle: TextStyle(
                                            fontFamily: 'Comfortaa',
                                            color: Colors.white),
                                        errorStyle: TextStyle(
                                            fontFamily: 'Comfortaa'),
                                        icon: Padding(
                                          padding:
                                          EdgeInsets.only(left: 5.0),
                                          child: Icon(
                                            Icons.supervised_user_circle,
                                            color: Colors.white,
                                            size: 28,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    TextFormField(
                                      style: TextStyle(color: Colors.white),
                                      controller: phoneController,
                                      keyboardType: TextInputType.number,
                                      validator: (val) {
                                        if (val.isNotEmpty) {
                                          if (int.parse(val) < 10) {
                                            return 'Please insert valid phone number';
                                          } else {
                                            phone = phoneController.text;
                                            return null;
                                          }
                                        } else {
                                          return null;
                                        }
                                      },
                                      decoration: InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.white,
                                              width: 2),
                                        ),
                                        hintText: phone,
                                        contentPadding: EdgeInsets.all(5.0),
                                        hintStyle: TextStyle(
                                            fontFamily: 'Comfortaa',
                                            color: Colors.white),
                                        errorStyle: TextStyle(
                                            fontFamily: 'Comfortaa'),
                                        icon: Padding(
                                          padding:
                                          EdgeInsets.only(left: 5.0),
                                          child: Icon(
                                            Icons.phone,
                                            color: Colors.white,
                                            size: 28,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    TextFormField(
                                      style: TextStyle(color: Colors.white),
                                      controller: emailController,
                                      validator: (String
                                      value) // used for validation
                                      {
                                        if (value.isNotEmpty) {
                                          return 'EmailId cannot be changed';
                                        } else {
                                          return null;
                                        }
                                      },
                                      decoration: InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.white,
                                              width: 2),
                                        ),
                                        hintText: email,
                                        contentPadding: EdgeInsets.all(5.0),
                                        hintStyle: TextStyle(
                                            fontFamily: 'Comfortaa',
                                            color: Colors.white),
                                        errorStyle: TextStyle(
                                            fontFamily: 'Comfortaa'),
                                        icon: Padding(
                                          padding:
                                          EdgeInsets.only(left: 5.0),
                                          child: Icon(
                                            Icons.alternate_email,
                                            color: Colors.white,
                                            size: 28,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 25,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                          width: 350.0,
                                          height: 40.0,
                                          child: Material(
                                            borderRadius:
                                                      BorderRadius.circular(
                                                          20.0),
                                                  shadowColor:
                                                      Colors.yellowAccent,
                                                  color: Colors.yellow[500],
                                                  elevation: 7.0,
                                                  child: InkWell(
                                                    onTap: () async {
                                                      togglePage("forgot");
                                                      print(
                                                          'change password button pressed');
                                                    },
                                                    child: Center(
                                                      child: Text(
                                                        'Change Password',
                                                        style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        58, 66, 86, 1.0),
                                                    fontWeight:
                                                    FontWeight.bold,
                                                    fontFamily: 'Comfortaa',
                                                    fontSize: 16.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),

                                        SizedBox(
                                          height: 20.0,
                                        ),

                                        Container(
                                          width: 350.0,
                                          height: 40.0,
                                          child: Material(
                                            borderRadius:
                                            BorderRadius.circular(20.0),
                                            shadowColor: Colors.yellowAccent,
                                            color: Colors.yellow[500],
                                            elevation: 7.0,
                                            child: InkWell(
                                              onTap: () async {
                                                if (_formkey.currentState
                                                    .validate()) {
                                                  setState(() {
                                                    loading = true;
                                                  });
                                                  return _changes(context);
                                                } else {
                                                  print("validation error");
                                                }
                                              },
                                              child: Center(
                                                child: Text(
                                                  'Save Changes',
                                                  style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        58, 66, 86, 1.0),
                                                    fontWeight:
                                                    FontWeight.bold,
                                                    fontFamily: 'Comfortaa',
                                                    fontSize: 16.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              )
                            ),
                      )
                    ],
                  ),
                ),
              ),
            );
          });
    }
  }

  void _changes(BuildContext context) async 
  {
    if(nameController.text == ''&& ageController.text == ''&& phoneController.text == ''&& emailController.text == ''&&url=='')
    { 
      return null;
    }
    else if(emailController.text != '') 
    {
      setState(() 
      {
        print("EmailId cannot be changed");
        Scaffold.of(context).showSnackBar(SnackBar(content:Text('EmailId cannot be changed')));
        loading = false;
        clear();
      });
    } 
    else if(url!='')
    {
      dynamic result = await _auth.editUser(name, age, phone, email, url);
      if (result == null) 
      {
        setState(() 
        {
          print("Please enter valid Profile Picture");
          Scaffold.of(context).showSnackBar(SnackBar(content: Text('Please enter valid details')));
          loading = false;
          clear();
        });
      } 
      else if (result != null) 
      {
        setState(() 
        {
          print("Profile Picture Updated");
          Scaffold.of(context).showSnackBar(SnackBar(content: Text('Profile Picture Updated')));
          loading = false;
          clear();
        });
      }
    }
    else 
    {
      print(name);
      print(age);
      print(phone);
      print(password);
      dynamic result = await _auth.editUser(name, age, phone, email, url);
      if (result == null) 
      {
        setState(() 
        {
          print("Please enter valid details");
          Scaffold.of(context).showSnackBar(SnackBar(content: Text('Please enter valid details')));
          loading = false;
          clear();
        });
      } 
      else if (result != null) 
      {
        setState(() 
        {
          print("Data Updated");
          Scaffold.of(context).showSnackBar(SnackBar(content: Text('Updated')));
          loading = false;
          clear();
        });
      }
    }
  }

  void clear() 
  {
    emailController.text = '';
    nameController.text = '';
    ageController.text = '';
    phoneController.text = '';
  }

  

  _openGallery(BuildContext context) async 
  {
    imageFile = await ImagePicker.pickImage(source: ImageSource.gallery);
    this.setState(() {
      loading=true;
      uploadPic(context);
    });
    Navigator.of(context).pop();
  }

  _removePhoto(BuildContext context) async 
  {
    var picture;
    this.setState(() 
    {
      imageFile = picture;
    });
    Navigator.of(context).pop();
  }

  Future<void> _showChoiceDialog(BuildContext context) 
  {
    return showDialog(
        context: context,
        builder: (BuildContext context) 
        {
          return AlertDialog(
            title: Text("Make a Choice"),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Padding(padding: EdgeInsets.all(8.0)),

                  GestureDetector
                  (
                    child: Text("Gallery"),
                    onTap: () 
                    {
                      debugPrint("Clicked");
                      _openGallery(context);
                    },
                  ),

                  Padding(padding: EdgeInsets.all(10.0)),

                  GestureDetector
                  (
                    child: Text("Remove Photo"),
                    onTap: () 
                    {
                      _removePhoto(context);
                    },
                  )
                ],
              ),
            ),
          );
        }
      );
  }

  Future uploadPic(BuildContext context) async
  {
      String fileName = basename(imageFile.path);
      StorageReference firebaseStorageRef = FirebaseStorage.instance.ref().child(fileName);
      StorageUploadTask uploadTask = firebaseStorageRef.putFile(imageFile);
      StorageTaskSnapshot taskSnapshot=await uploadTask.onComplete;
       final String imgurl = (await taskSnapshot.ref.getDownloadURL());
      setState(() 
      {
        print("Profile Picture uploaded");
        loading=false;
        url=imgurl;
        print(url);
        // Scaffold.of(context).showSnackBar(SnackBar(content: Text('Profile Picture Uploaded')));
      });
    }
}
