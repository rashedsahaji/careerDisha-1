import 'package:careerdisha/screens/signupnew.dart';
import 'package:careerdisha/shared/loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'loginnew.dart';

class Video extends StatefulWidget {
  @override
  _VideoState createState() => _VideoState();
}

class _VideoState extends State<Video> {
  String videoUrl= "https://www.youtube.com/watch?v=uZV4C9xMwjY";

  YoutubePlayerController  _controller;
  @override
  void initState() {

    _controller = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(videoUrl),
      flags: YoutubePlayerFlags(
        autoPlay: true,
      ),
    );

    super.initState();
  }

  bool loading = false;
  String option;
  void toggleVideo(String toggle) {
    print("video page");
    setState(() {
      return option = toggle;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (option == "login") {
      return LoginNew();
    } else if (option == "register") {
      print("register");
      return SignupPage();
    }
    else {
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
                                EdgeInsets.fromLTRB(170.0, 115.0, 0.0, 0.0),
                            child: Text('.',
                                style: TextStyle(
                                    fontSize: 90.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.yellowAccent[400])),
                          )
                        ]
                ),
              ),
              Column(
                children: <Widget>[
                  SizedBox(
                    width: 310,
                    child: Divider(
                      thickness: 2,
                      color: Colors.yellow[600],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                    child: Text('Video Tour of Career Disha',
                      style:
                      TextStyle(
                          color: Colors.yellow[600],
                          fontFamily: 'Montserrat'
                      ),),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.yellow[600],
                        boxShadow: [
                          new BoxShadow(
                            color: Colors.yellow[700],
                            blurRadius: 15.0,
                          ),
                        ]),
                    height: 300,
                    width: 380,
                    child: YoutubePlayer(
                      controller: _controller,
                      showVideoProgressIndicator: true,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    // height: 75,
                    width: 600,
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 12,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 0, horizontal: 15),
                          height: 40.0,
                          child: Material(
                            borderRadius: BorderRadius.circular(20.0),
                            shadowColor: Colors.yellowAccent,
                            color: Colors.yellow[600],
                            elevation: 7.0,
                            child: InkWell(
                              onTap: () async {
                                toggleVideo("login");
                              },
                              child: Center(
                                child: Text(
                                  'LogIn Now',
                                  style: TextStyle(
                                      color: Color.fromRGBO(58, 66, 86, 1.0),
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Montserrat'),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 15.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'New to CarrerDisha ?',
                        style: TextStyle(
                            fontFamily: 'Montserrat', color: Colors.white),
                      ),
                      SizedBox(width: 5.0),
                      InkWell(
                        onTap: () {
                          toggleVideo("register");
                          // widget.toggleView();
                          // runApp(Register());
                          print('register button pressed');
                        },
                        child: Text(
                          'Register',
                          style: TextStyle(
                              color: Colors.yellow[600],
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline),
                        ),
                      )
                    ],
                  )],
              ),
            ],
          ),
              ),
      );
    }
  }
}
