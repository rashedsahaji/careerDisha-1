import 'package:careerdisha/models/jobslist.dart';
import 'package:careerdisha/models/user.dart';
import 'package:careerdisha/services/database.dart';
import 'package:careerdisha/services/jsonservice.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';


class AppHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
          fontFamily: 'Raleway',
          primaryColor: Color.fromRGBO(58, 66, 86, 1.0),
          primarySwatch: Colors.yellow
          ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool loading = false;

  List<JobsList> _joblist;
  // List<Filters> _filter;
  bool _fetching;
  String experience='';
  String category='';
  String location='';
  String pay='';

  @override
  void initState() {
    super.initState();
    _fetching = true;
    JsonServices.getJobList().then((joblist) {
      setState(() {
        _joblist = joblist;
        _fetching = false;
      });
    });
  }


  Widget build(BuildContext context) 
  {
    final user = Provider.of<User>(context);
    
    return StreamBuilder<UserData>(
          stream: DatabaseService(userid: user.uid).users,
          builder: (context, snapshot) 
          {
            if (snapshot.hasData) 
            {
              UserData userdata = snapshot.data;
              experience = userdata.experience;
              print(experience);
              category = userdata.category;
              print(category);
              location = userdata.location;
              print(location);
              pay = userdata.pay;
              print(pay);
            } 
            return Scaffold(
              backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
              appBar: AppBar(
                elevation: 0.1,
                backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),  
             
        actions: <Widget>[
          IconButton(
            icon: Icon(
             Icons.help_outline,
             color: Colors.yellowAccent,
            ),
            onPressed: () {
              _help(context);
            },
          ),
        ],
        title: Text(
          _fetching ? 'Fetching...' : 'Careerদিশা',
          style: TextStyle(fontFamily: 'Montserrat'),
        ),
      ),
      body: Container(
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: null == _joblist ? 0 : _joblist.length,
            itemBuilder: (context, index) {

              JobsList joblist = _joblist[index];
              // Filters filter = _filter[index];
              // filter.jobtitle="hsg";
              return Card(
                margin:
                    new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
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
                      child: Icon(Icons.call_made, color: Colors.white),
                    ),
                    title: 
                      Text(joblist.jobtitle,
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
                          child: Text(joblist.company,
                              style: TextStyle(color: Colors.white)),
                        ),
                      ],
                    ),
                    trailing: Icon(Icons.keyboard_arrow_down,
                        color: Colors.white, size: 20.0),
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (BuildContext bc) {
                            return Container(
                              child: ListView(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.all(40.0),
                                    decoration: BoxDecoration(
                                        color: Color.fromRGBO(58, 66, 86, .9)),
                                    child: Center(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Icon(
                                            Icons.people,
                                            color: Colors.white,
                                            size: 40.0,
                                          ),
                                          Container(
                                            width: 90.0,
                                            child: new Divider(
                                                color: Colors.yellow[400]),
                                          ),

                                          SizedBox(height: 10.0),
                                          
                                          Text(
                                            joblist.jobtitle,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 25.0),
                                          ),

                                          SizedBox(height: 10.0),
                                          
                                          Text(
                                            joblist.company,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 11.0),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),

                                  SizedBox(
                                    height: 5,
                                  ),

                                  Container(
                                      padding: EdgeInsets.all(20.0),
                                      child: Column(
                                        children: <Widget>[
                                          Text(
                                            "Location: " +
                                                joblist.joblocationAddress,
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontFamily: "Raleway"),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Container(
                                            width: 90.0,
                                            child: new Divider(
                                                color: Color.fromRGBO(
                                                    58, 66, 86, 1.0)),
                                          ),
                                          Text(
                                            joblist.jobdescription,
                                            style: TextStyle(
                                                fontFamily: "Raleway"),
                                          ),
                                          SizedBox(
                                            height: 20,
                                            width: 300,
                                            child: Divider(
                                              color: Color.fromRGBO(
                                                  58, 66, 86, 1.0),
                                            ),
                                          ),
                                          Text(
                                            "PayRate: " + joblist.payrate,
                                            style: TextStyle(
                                                fontFamily: "Raleway",
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            "Education: " + joblist.education,
                                            style: TextStyle(
                                                fontFamily: "Raleway",
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            "Exprience: " + joblist.experience,
                                            style: TextStyle(
                                                fontFamily: "Raleway",
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            "Industry: " + joblist.industry,
                                            style: TextStyle(
                                                fontFamily: "Raleway",
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Container(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 15.0),
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              child: RaisedButton(
                                                onPressed: () =>
                                                    _showMyDialog(),
                                                color: Color.fromRGBO(
                                                    58, 66, 86, 1.0),
                                                child: Text("Apply Now",
                                                    style: TextStyle(
                                                        fontFamily: "Raleway",
                                                        color: Colors.white)),
                                              ))
                                        ],
                                      ))
                                ],
                              ),
                            );
                          }
                        );
                    },
                  ),
                ),
              );
            }),
      ),
    );
    }
    );
    
  }

  var email="careerdisha2020@gmail.com";
  _launchemail() async{
    const emailaddress = 'mailto:careerdisha2020@gmail.com?subject=Help';

    if(await canLaunch(emailaddress)) {
      await launch(emailaddress);
    }  else {
      throw 'Could not Email';
    }   
  }
  
  _sms() async 
  { 
    const url = "sms:1234567890";   
    if (await canLaunch(url)) {
       await launch(url);
    } else {
      throw 'Could not launch $url';
    }   
  }

  Future<void> _help(BuildContext context) 
  {
    return showDialog(
        context: context,
        builder: (BuildContext context) 
        {
          return AlertDialog(
            title: Text("How to reach us"),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Padding(padding: EdgeInsets.all(8.0)),

                  GestureDetector
                  (
                    child: Text("Email"),
                    onTap: () 
                    {
                      _launchemail();
                    },
                  ),

                  Padding(padding: EdgeInsets.all(10.0)),

                  GestureDetector
                  (
                    child: Text("SMS"),
                    onTap: () 
                    {
                      _sms();
                    },
                  )
                ],
              ),
            ),
          );
        }
      );
    }
    Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Thanks for Showing Interest'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('You will be redirected to official webpage'),
                Text('App is just a prototype, for presentation purpose'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Approve'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

}
