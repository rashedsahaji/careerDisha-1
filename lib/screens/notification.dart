import 'package:flutter/material.dart';

import 'package:flutter_icons/flutter_icons.dart';

import 'practice.dart';

class Noti extends StatefulWidget {
  @override
  _NotiState createState() => _NotiState();
}

class _NotiState extends State<Noti> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),  
             
        actions: <Widget>[
          IconButton(
            icon: Icon(Ionicons.ios_book,
            //  Icons.
             color: Colors.yellowAccent,
            ),
            onPressed: () {
              // Test();
              // Filter();
              // _showFilter(context);
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return Practice();
              }));
            },
          ),
        ],
        title: Text( "Notification",
          style: TextStyle(fontFamily: 'Montserrat'),
        ),
      ),
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      body: Container(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Searchvector(),
                ),
                SizedBox(
                  width: 12,
                ),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 45),
                      child: Banner(),
                    ),
                    SizedBox(
                      height: 15,
                      width: 200,
                      child: Divider(
                        color: Colors.yellow[400],
                      ),
                    ),
                    Subbanner(),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Expanded(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.55,
                color: Color.fromRGBO(58, 66, 86, 1.0),
                child: Text(
                  'No Notification',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
//Subbanner
class Subbanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Latest Notification down below',
        style: TextStyle(
          fontFamily: 'Comfortaa',
          fontSize: 12,
          color: Colors.white,
        ),
      ),
    );
  }
}

//Banner
class Banner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Job Notification',
        style: TextStyle(
          fontFamily: 'Comfortaa',
          fontSize: 20,
          color: Colors.white,
        ),
      ),
    );
  }
}

//ICon
class Searchvector extends StatefulWidget {
  @override
  _SearchvectorState createState() => _SearchvectorState();
}

class _SearchvectorState extends State<Searchvector> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Padding(
          padding: EdgeInsets.only(top: 50),
          child: CircleAvatar(
            backgroundColor: Colors.yellow[400],
            child: Icon(Icons.notifications, size: 40, color: Color.fromRGBO(58, 66, 86, 1.0)),
            radius: 35,
          ),
        ),
      ),
    );
  }
}