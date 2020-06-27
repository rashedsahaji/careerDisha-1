import 'dart:async';

import 'package:careerdisha/models/jobslist.dart';
import 'package:careerdisha/screens/filter.dart';
import 'package:careerdisha/services/jsonservice.dart';
import 'package:flutter/material.dart';

class SearchJobs extends StatefulWidget {
  SearchJobs() : super();

  @override
  _SearchJobsState createState() => _SearchJobsState();
}

class Debouncer {
  final int milliseconds;
  VoidCallback action;
  Timer _timer;

  Debouncer({this.milliseconds});

  run(VoidCallback action) {
    if (null != _timer) {
      _timer.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}

class _SearchJobsState extends State<SearchJobs> {
  bool isChecked = false;
  final _debouncer = Debouncer(milliseconds: 300);
  List<JobsList> jobs = List();
  List<JobsList> filteredJobs = List();

@override
  void initState() {
    super.initState();
    JsonServices.getJobList().then((usersFromServer) {
      setState(() {
        jobs = usersFromServer;
      });
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0), 
      appBar: AppBar(
  title: Text("Job Search"),
  actions: <Widget>[
    FlatButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return Filter();
              }));
            },
            child: Row(
              children: <Widget>[
                Text(
                  'Apply Filter',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'Montserrat'),
                ),
                SizedBox(
                  width: 5,
                ),
                Icon(
                  Icons.filter_list,
                  color: Colors.yellowAccent[400],
                ),
              ],
            ))
  ],
),
      body: SafeArea(
        child: Column(
          children: <Widget> [
            Row(
      children: <Widget>[
        Expanded(
          child: Container(
            height: 45,
            margin: const EdgeInsets.only(left: 12.0,right: 12.0, bottom: 8.0,top: 10.0),
            decoration: BoxDecoration(
              color: Colors.yellow[400],
              borderRadius: BorderRadius.circular(24.0),
            ),
            child: TextFormField(
              onChanged: (string) {
                _debouncer.run(() {
                  setState(() {
                    filteredJobs = jobs
                        .where((u) => (u.jobtitle.toLowerCase().contains(string.toLowerCase()) ||u.company.toLowerCase().contains(string.toLowerCase()))).toList();
                  });
                });
              },
              cursorColor: Color.fromRGBO(58, 66, 86, 1.0),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(15.0),
                hintText: 'Search by Jobtitle or Company',
                hintStyle: TextStyle(
                    fontFamily: 'comfotraa',
                    fontWeight: FontWeight.bold
                    ),
                border: InputBorder.none,
                suffixIcon: Icon(
                  Icons.search,
                  color: Color.fromRGBO(58, 66, 86, 1.0),
                ),
              ),
            ),
          ),
        ),
      ],
    ),
            Expanded(child:
              ListView.builder(
                padding: EdgeInsets.all(10.0),
                itemCount: filteredJobs.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    color: Color.fromRGBO(64, 75, 96, .9),
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: ListTile(
                        title: Text(
                          filteredJobs[index].jobtitle,
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                          ),
                        ),
                        subtitle: Expanded(
                          child: Text(
                            filteredJobs[index].company.toLowerCase(),
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.yellow[500],
                            ),
                          ),
                        ),
                        trailing: Icon(
                          Icons.drag_handle,
                          color: Colors.yellow[500],
                        ),
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
                                            color:
                                                Color.fromRGBO(58, 66, 86, .9)),
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
                                                    color: Colors.yellowAccent),
                                              ),
                                              SizedBox(height: 10.0),
                                              Text(
                                                filteredJobs[index].jobtitle,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 25.0),
                                              ),
                                              SizedBox(height: 10.0),
                                              Text(
                                                filteredJobs[index].company,
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
                                                "Location:" +
                                                    filteredJobs[index]
                                                        .joblocationAddress,
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
                                                filteredJobs[index]
                                                    .jobdescription,
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
                                                "PayRate: " +
                                                    filteredJobs[index].payrate,
                                                style: TextStyle(
                                                    fontFamily: "Raleway",
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                "Education: " +
                                                    filteredJobs[index]
                                                        .education,
                                                style: TextStyle(
                                                    fontFamily: "Raleway",
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                "Exprience: " +
                                                    filteredJobs[index]
                                                        .experience,
                                                style: TextStyle(
                                                    fontFamily: "Raleway",
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                "Industry: " +
                                                    filteredJobs[index]
                                                        .industry,
                                                style: TextStyle(
                                                    fontFamily: "Raleway",
                                                    fontWeight:
                                                        FontWeight.bold),
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
                                                            fontFamily:
                                                                "Raleway",
                                                            color:
                                                                Colors.white)),
                                                  ))
                                            ],
                                          ))
                                    ],
                                  ),
                                );
                              });
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
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
  // var checkBoxValue=false;
  
  // Future<void> _showFilter(BuildContext context) 
  // {
    
  //   return showDialog(
  //       context: context,
  //       builder: (BuildContext context) 
  //       {
  //         return AlertDialog
  //         (
  //           title: Text("Enter OTP"),
  //           content: SingleChildScrollView
  //           (
  //             child: Row
  //             (
  //               children: <Widget>
  //               [
  //                 DropdownButton(
  //                   items: [
  //                     DropdownMenuItem(
  //                       child: Text("Job Category"),),
  //                     DropdownMenuItem(
  //                       child: Row(
  //                         children: <Widget>[
  //                           Checkbox(
  //                             // title: const Text('railway'),
  //                             value: isChecked,
  //                               activeColor:Colors.black,
  //                               onChanged: (value) {
  //                                 setState(() {
  //                                    isChecked=value;
  //                                 });
  //                               },
  //                             ),
  //                             Text('Remember me'),

                              

  //                           // Checkbox(
  //                           //   value: false,//checkBoxValue,
  //                           //   activeColor: Colors.green,
  //                           //   onChanged:(bool newValue)
  //                           //   {
  //                           //   setState(() {
  //                           //     // checkBoxValue = newValue;
  //                           //   });
  //                           //   Text('Remember me');
  //                           // }
  //                           // ),
  //                         ],
  //                       ),
  //                     ),
  //             // DropdownMenuItem(
  //             //   child: Row(
  //             //     children: <Widget>[
  //             //       Checkbox(
  //             //         onChanged: (bool check) {
  //             //         },
  //             //         value: false,
  //             //       ),
  //             //       Text('Second'),
  //             //     ],
  //             //   ),
  //             // )
  //           ],
  //           onChanged: (value) {
  //           },
  //           hint: Text('Select value'),
  //         )
  //       ],
  //                   //     Padding(padding: EdgeInsets.all(10.0)),
                  
  //                   //     Container
  //                   //     (
  //                   //       height: 40.0,
  //                   //       child: Material
  //                   //         (
  //                   //         borderRadius: BorderRadius.circular(20.0),
  //                   //         shadowColor: Colors.yellowAccent,
  //                   //         color: Colors.yellow[400],
  //                   //         elevation: 7.0,
  //                   //         child: InkWell
  //                   //         (
  //                   //           onTap: () async
  //                   //           {
  //                   //             // if (_otpkey.currentState.validate()) 
  //                   //             // {
  //                   //               // Navigator.of(context).pop();
  //                   //                 // print("welcome");
  //                   //                 // setState(() => loading = true);
  //                   //                 // dynamic result = await _auth.register(name, age, phone, email, password);
  //                   //                 // if (result == null) 
  //                   //                 // {
  //                   //                   // setState(() {
  //                   //                       // error = 'Please enter valid details';
  //                   //                       // loading = false;
  //                   //                     // });
  //                   //                 // }
  //                   //             // }

  //                   //            },
  //                   //            child: Center
  //                   //            (
  //                   //             child: Text
  //                   //               (
  //                   //               'SUBMIT',
  //                   //               style: TextStyle
  //                   //                 (
  //                   //                   color: Color.fromRGBO(58, 66, 86, 1.0),
  //                   //                   fontWeight: FontWeight.bold,
  //                   //                   fontFamily: 'Montserrat'
  //                   //               ),
  //                   //             ),
  //                   //           ),
  //                   //         ),
  //                   //       )
  //                   //   ),
  //                   // ],
  //                 )
  //               ),
  //             // ],
  //           // ),
  //         // ),
  //       );
  //     }
  //   );
  // }
}