import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class Practice extends StatefulWidget {
  @override
  _PracticeState createState() => _PracticeState();
}

class _PracticeState extends State<Practice> {


  _launchurl(String downloadurl) async{
    var url = downloadurl;

    if(await canLaunch(url)) {
      await launch(url);
    }  else {
      throw 'Could not download';
    }   
  }

  _video()async 
  {
    String videoUrl= "https://www.youtube.com/channel/UCeFrVSEkb8ixKDpNCwujpXA";

    if(await canLaunch(videoUrl)) {
      await launch(videoUrl);
    }  else {
      throw 'Cannot connect';
    }   

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),  
        title: Text(
          'Practice Set',
          style: TextStyle(fontFamily: 'Montserrat'),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
             Icons.play_circle_filled,
             color: Colors.yellowAccent,
            ),
            onPressed: () {
              _video();
            },
          ),
        ],
        
      ),


      body:ListView(
        children:<Widget>[
            Card(
                margin:EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                elevation: 8.0,
                child: Container(
                  decoration:
                      BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
                      child: ListTile(
                        contentPadding:
                          EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    leading: Container(
                      padding: EdgeInsets.only(right: 12.0),
                      decoration: new BoxDecoration(
                          border: new Border(
                              right: new BorderSide(
                                  width: 1.0, color: Colors.white24))),
                      child: Icon(Icons.picture_as_pdf, color: Colors.yellow[400]),
                    ),
                    title: 
                      Text("Airport",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Row(
                      children: <Widget>[
                        Icon(Icons.linear_scale,
                            color: Colors.yellowAccent[400]),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: Text("Airport Authority Of India",
                              style: TextStyle(color: Colors.white)),
                        ),
                      ],
                    ),
                    trailing: Icon(Icons.file_download,
                        color: Colors.yellow[400], size: 20.0),
                    onTap: () {
                      setState(() {
                        _launchurl("https://drive.google.com/drive/folders/0BzQbOchjLyKQeXdrbkZoSFhMY3c");
                      });
                    },
                  ),
                ),
              ),

              Card(
                margin:EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                elevation: 8.0,
                child: Container(
                  decoration:
                      BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
                      child: ListTile(
                        contentPadding:
                          EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    leading: Container(
                      padding: EdgeInsets.only(right: 12.0),
                      decoration: new BoxDecoration(
                          border: new Border(
                              right: new BorderSide(
                                  width: 1.0, color: Colors.white24))),
                      child: Icon(Icons.picture_as_pdf, color: Colors.yellow[400]),
                    ),
                    title: 
                      Text("DMRC",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Row(
                      children: <Widget>[
                        Icon(Icons.linear_scale,
                            color: Colors.yellowAccent[400]),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: Text("Delhi Metro Railway Corporation",
                              style: TextStyle(color: Colors.white)),
                        ),
                      ],
                    ),
                    trailing: Icon(Icons.file_download,
                        color: Colors.yellow[400], size: 20.0),
                    onTap: () {
                      setState(() {
                        _launchurl("https://drive.google.com/file/d/0BzQbOchjLyKQMmdMNTNWV0k1bmc/view");
                      });
                    },
                  ),
                ),
              ),

              Card(
                margin:EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                elevation: 8.0,
                child: Container(
                  decoration:
                      BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
                      child: ListTile(
                        contentPadding:
                          EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    leading: Container(
                      padding: EdgeInsets.only(right: 12.0),
                      decoration: new BoxDecoration(
                          border: new Border(
                              right: new BorderSide(
                                  width: 1.0, color: Colors.white24))),
                      child: Icon(Icons.picture_as_pdf, color: Colors.yellow[400]),
                    ),
                    title: 
                      Text("DRDO",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Row(
                      children: <Widget>[
                        Icon(Icons.linear_scale,
                            color: Colors.yellowAccent[400]),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: Text("Defence",
                              style: TextStyle(color: Colors.white)),
                        ),
                      ],
                    ),
                    trailing: Icon(Icons.file_download,
                        color: Colors.yellow[400], size: 20.0),
                    onTap: () {
                      setState(() {
                        _launchurl("https://drive.google.com/file/d/198Sr4TF20WtpnzRLWuIbd9XHxWKiflBf/view");
                      });
                    },
                  ),
                ),
              ),

              Card(
                margin:EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                elevation: 8.0,
                child: Container(
                  decoration:
                      BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
                      child: ListTile(
                        contentPadding:
                          EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    leading: Container(
                      padding: EdgeInsets.only(right: 12.0),
                      decoration: new BoxDecoration(
                          border: new Border(
                              right: new BorderSide(
                                  width: 1.0, color: Colors.white24))),
                      child: Icon(Icons.picture_as_pdf, color: Colors.yellow[400]),
                    ),
                    title: 
                      Text("FCI",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Row(
                      children: <Widget>[
                        Icon(Icons.linear_scale,
                            color: Colors.yellowAccent[400]),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: Text("Food Corporation of India",
                              style: TextStyle(color: Colors.white)),
                        ),
                      ],
                    ),
                    trailing: Icon(Icons.file_download,
                        color: Colors.yellow[400], size: 20.0),
                    onTap: () {
                      setState(() {
                        _launchurl("https://drive.google.com/file/d/1eRwtqQvEAtAWe_oAgVzbNE1Xz_DB4-FY/view");
                      });
                    },
                  ),
                ),
              ),

              Card(
                margin:EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                elevation: 8.0,
                child: Container(
                  decoration:
                      BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
                      child: ListTile(
                        contentPadding:
                          EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    leading: Container(
                      padding: EdgeInsets.only(right: 12.0),
                      decoration: new BoxDecoration(
                          border: new Border(
                              right: new BorderSide(
                                  width: 1.0, color: Colors.white24))),
                      child: Icon(Icons.picture_as_pdf, color: Colors.yellow[400]),
                    ),
                    title: 
                      Text("Forest Department",
                       style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Row(
                      children: <Widget>[
                        Icon(Icons.linear_scale,
                            color: Colors.yellowAccent[400]),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: Text("Indian Forest Service ",
                              style: TextStyle(color: Colors.white)),
                        ),
                      ],
                    ),
                    trailing: Icon(Icons.file_download,
                        color: Colors.yellow[400], size: 20.0),
                    onTap: () {
                      setState(() {
                        _launchurl("https://drive.google.com/drive/folders/0BzQbOchjLyKQbEZQb1VuVVBkNlk");
                      });
                    },
                  ),
                ),
              ),

              Card(
                margin:EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                elevation: 8.0,
                child: Container(
                  decoration:
                      BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
                      child: ListTile(
                        contentPadding:
                          EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    leading: Container(
                      padding: EdgeInsets.only(right: 12.0),
                      decoration: new BoxDecoration(
                          border: new Border(
                              right: new BorderSide(
                                  width: 1.0, color: Colors.white24))),
                      child: Icon(Icons.picture_as_pdf, color: Colors.yellow[400]),
                    ),
                    title: 
                      Text("Income Tax",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Row(
                      children: <Widget>[
                        Icon(Icons.linear_scale,
                            color: Colors.yellowAccent[400]),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: Text("Income Tax Department",
                              style: TextStyle(color: Colors.white)),
                        ),
                      ],
                    ),
                    trailing: Icon(Icons.file_download,
                        color: Colors.yellow[400], size: 20.0),
                    onTap: () {
                      setState(() {
                        _launchurl("https://drive.google.com/drive/folders/0BzQbOchjLyKQbEZQb1VuVVBkNlk");
                      });
                    },
                  ),
                ),
              ),

              


              Card(
                margin:EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                elevation: 8.0,
                child: Container(
                  decoration:
                      BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
                      child: ListTile(
                        contentPadding:
                          EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    leading: Container(
                      padding: EdgeInsets.only(right: 12.0),
                      decoration: new BoxDecoration(
                          border: new Border(
                              right: new BorderSide(
                                  width: 1.0, color: Colors.white24))),
                      child: Icon(Icons.picture_as_pdf, color: Colors.yellow[400]),
                    ),
                    title: 
                      Text("LIC",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Row(
                      children: <Widget>[
                        Icon(Icons.linear_scale,
                            color: Colors.yellowAccent[400]),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: Text("Life Insurance Corporation",
                              style: TextStyle(color: Colors.white)),
                        ),
                      ],
                    ),
                    trailing: Icon(Icons.file_download,
                        color: Colors.yellow[400], size: 20.0),
                    onTap: () {
                      setState(() {
                        _launchurl("https://drive.google.com/file/d/1zJrEVFB2zdqBVpd1foh8EAYhkVJbKsge/view");
                      });
                    },
                  ),
                ),
              ),

              Card(
                margin:EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                elevation: 8.0,
                child: Container(
                  decoration:
                      BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
                      child: ListTile(
                        contentPadding:
                          EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    leading: Container(
                      padding: EdgeInsets.only(right: 12.0),
                      decoration: new BoxDecoration(
                          border: new Border(
                              right: new BorderSide(
                                  width: 1.0, color: Colors.white24))),
                      child: Icon(Icons.picture_as_pdf, color: Colors.yellow[400]),
                    ),
                    title: 
                      Text("NDA",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Row(
                      children: <Widget>[
                        Icon(Icons.linear_scale,
                            color: Colors.yellowAccent[400]),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: Text("Indian Army",
                              style: TextStyle(color: Colors.white)),
                        ),
                      ],
                    ),
                    trailing: Icon(Icons.file_download,
                        color: Colors.yellow[400], size: 20.0),
                    onTap: () {
                      setState(() {
                        _launchurl("https://drive.google.com/file/d/1xbQ0xHKnPyX0u2zStFh8S8kXvLucQeAx/view");
                      });
                    },
                  ),
                ),
              ),
              
              Card(
                margin:EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                elevation: 8.0,
                child: Container(
                  decoration:
                      BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
                      child: ListTile(
                        contentPadding:
                          EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    leading: Container(
                      padding: EdgeInsets.only(right: 12.0),
                      decoration: new BoxDecoration(
                          border: new Border(
                              right: new BorderSide(
                                  width: 1.0, color: Colors.white24))),
                      child: Icon(Icons.picture_as_pdf, color: Colors.yellow[400]),
                    ),
                    title: 
                      Text("Police",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Row(
                      children: <Widget>[
                        Icon(Icons.linear_scale,
                            color: Colors.yellowAccent[400]),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: Text("Indian Police Force",
                              style: TextStyle(color: Colors.white)),
                        ),
                      ],
                    ),
                    trailing: Icon(Icons.file_download,
                        color: Colors.yellow[400], size: 20.0),
                    onTap: () {
                      setState(() {
                        _launchurl("https://drive.google.com/drive/folders/0BzQbOchjLyKQV2I2SnFzelBYYVU");
                      });
                    },
                  ),
                ),
              ),

              Card(
                margin:EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                elevation: 8.0,
                child: Container(
                  decoration:
                      BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
                      child: ListTile(
                        contentPadding:
                          EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    leading: Container(
                      padding: EdgeInsets.only(right: 12.0),
                      decoration: new BoxDecoration(
                          border: new Border(
                              right: new BorderSide(
                                  width: 1.0, color: Colors.white24))),
                      child: Icon(Icons.picture_as_pdf, color: Colors.yellow[400]),
                    ),
                    title: 
                      Text("Railway",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Row(
                      children: <Widget>[
                        Icon(Icons.linear_scale,
                            color: Colors.yellowAccent[400]),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: Text("Indian Railways",
                              style: TextStyle(color: Colors.white)),
                        ),
                      ],
                    ),
                    trailing: Icon(Icons.file_download,
                        color: Colors.yellow[400], size: 20.0),
                    onTap: () {
                      setState(() {
                        _launchurl("https://drive.google.com/drive/folders/1fYbEOrCyJqTzYXpzQF0drJh56UBI8TEF");
                      });
                    },
                  ),
                ),
              ),

              Card(
                margin:EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                elevation: 8.0,
                child: Container(
                  decoration:
                      BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
                      child: ListTile(
                        contentPadding:
                          EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    leading: Container(
                      padding: EdgeInsets.only(right: 12.0),
                      decoration: new BoxDecoration(
                          border: new Border(
                              right: new BorderSide(
                                  width: 1.0, color: Colors.white24))),
                      child: Icon(Icons.picture_as_pdf, color: Colors.yellow[400]),
                    ),
                    title: 
                      Text("RBI",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Row(
                      children: <Widget>[
                        Icon(Icons.linear_scale,
                            color: Colors.yellowAccent[400]),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: Text("Reserve Bank Of India",
                              style: TextStyle(color: Colors.white)),
                        ),
                      ],
                    ),
                    trailing: Icon(Icons.file_download,
                        color: Colors.yellow[400], size: 20.0),
                    onTap: () {
                      setState(() {
                        _launchurl("https://drive.google.com/file/d/0BzQbOchjLyKQbEUtT2JNNTVRVjA/view");
                      });
                    },
                  ),
                ),
              ),

              Card(
                margin:EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                elevation: 8.0,
                child: Container(
                  decoration:
                      BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
                      child: ListTile(
                        contentPadding:
                          EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    leading: Container(
                      padding: EdgeInsets.only(right: 12.0),
                      decoration: new BoxDecoration(
                          border: new Border(
                              right: new BorderSide(
                                  width: 1.0, color: Colors.white24))),
                      child: Icon(Icons.picture_as_pdf, color: Colors.yellow[400]),
                    ),
                    title: 
                      Text("RPF",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Row(
                      children: <Widget>[
                        Icon(Icons.linear_scale,
                            color: Colors.yellowAccent[400]),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: Text("Indian Army",
                              style: TextStyle(color: Colors.white)),
                        ),
                      ],
                    ),
                    trailing: Icon(Icons.file_download,
                        color: Colors.yellow[400], size: 20.0),
                    onTap: () {
                      setState(() {
                        _launchurl("https://drive.google.com/drive/folders/0BzQbOchjLyKQOWZtaDg1aEZQeHc");                        
                      });
                    },
                  ),
                ),
              ),

              

          ]
        )
     );
  }
}
