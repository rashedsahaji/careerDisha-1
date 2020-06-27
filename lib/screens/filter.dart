import 'package:careerdisha/models/user.dart';
import 'package:careerdisha/services/auth.dart';
import 'package:careerdisha/services/database.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class Filter extends StatefulWidget {
  @override
  _FilterState createState() => _FilterState();
  
}

class _FilterState extends State<Filter> {

  String email = '';
  String age = '';
  String phone = '';
  String name = '';
  String url='';
  String password='';

  final AuthService _auth = AuthService();
  List _experience;
  List _category;
  List _location;
  List _payrate;
  String _experienceResult;
  String _categoryResult;
  String _locationResult;
  String _payrateResult;
  final formKey = new GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _experience = [];
    _category = [];
    _location = [];
    _payrate = [];
    _experienceResult = '';
    _categoryResult = '';
    _locationResult = '';
    _payrateResult = '';
  }

  @override
  Widget build(BuildContext context) 
  {
    final user = Provider.of<User>(context);
   
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
            } return Scaffold(
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      appBar: AppBar(
        title: Text('Apply Filters'),
        
      ),

      body: ListView(
        children:<Widget>[
          Center(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                color: Color.fromRGBO(58, 66, 86, 1.0),
                padding: EdgeInsets.all(16),
                child: Column(
                  children:<Widget>[
                  MultiSelectFormField(
                  fillColor: Color.fromRGBO(58, 66, 86, 1.0),
                  autovalidate: false,
                  titleText: 'Experience',
                  dataSource: [                    
                    {
                      "display": "0 years",
                      "value": "0 years",
                    },
                    {
                      "display": "1-2 years",
                      "value": "1-2 years",
                    },
                    {
                      "display": "3-4 years",
                      "value": "3-4 years",
                    },
                    {
                      "display": "5-6 years",
                      "value": "5-6 years",
                    },
                    {
                      "display": "7-8 years",
                      "value": "7-8 years",
                    },
                    {
                      "display": "9-10 years",
                      "value": "9-10 years",
                    },
                    {
                      "display": "Above 10 years",
                      "value": "Above 10 years",
                    },
                  ],
                  textField: 'display',
                  valueField: 'value',
                  okButtonLabel: 'OK', 
                  cancelButtonLabel: 'CANCEL',
                  hintText: 'Please choose one or more',
                  initialValue: _experience,

                  onSaved: (value) {
                    if (value == null) return;
                    setState(() {
                      _experience = value;
                    });
                  },
                ),

                SizedBox(
                  height: 15.0,
                ),

                MultiSelectFormField(
                  autovalidate: false,
                  fillColor: Color.fromRGBO(58, 66, 86, 1.0),
                  titleText: 'Job Category',
                  dataSource: [
                    {
                      "display": "PHP developer",
                      "value": "PHP developer",
                    },
                    {
                      "display": "JS developer",
                      "value": "JS developer",
                    },
                    {
                      "display": "Railway",
                      "value": "Railway",
                    },
                    {
                      "display": "Police",
                      "value": "Police",
                    },
                    {
                      "display": "Navy",
                      "value": "Navy",
                    },
                    {
                      "display": "Army",
                      "value": "Army",
                    },
                    {
                      "display": "Air Force",
                      "value": "Air Force",
                    },
                    {
                      "display": "Forest Department",
                      "value": "Forest Department",
                    },
                    {
                      "display": "Doctor",
                      "value": "Doctor",
                    },
                    {
                      "display": "Teacher",
                      "value": "Teacher",
                    },
                    {
                      "display": "Bank Jobs",
                      "value": "Bank Jobs",
                    },
                    {
                      "display": "Airport Jobs",
                      "value": "Airport Jobs",
                    },
                    {
                      "display": "Engineering Jobs",
                      "value": "Engineering Jobs",
                    },
                    {
                      "display": "Central Govt. Jobs",
                      "value": "Central Govt. Jobs",
                    },
                    {
                      "display": "Insurance Jobs",
                      "value": "Insurance Jobs",
                    },
                    {
                      "display": "Hospital Jobs",
                      "value": "Hospital Jobs",
                    },
                    {
                      "display": "Agriculture Jobs",
                      "value": "Agriculture Jobs",
                    },
                    {
                      "display": "others",
                      "value": "others",
                    },  
                  ],
                  textField: 'display',
                  valueField: 'value',
                  okButtonLabel: 'OK',
                  cancelButtonLabel: 'CANCEL',
                  // required: true,
                  hintText: 'Please choose one or more',
                  initialValue: _category,
                  onSaved: (value) {
                    if (value == null) return;
                    setState(() {
                      _category = value;
                    });
                  },
                ),

                SizedBox(
                  height: 15.0,
                ),

                MultiSelectFormField(
                  autovalidate: false,
                  fillColor: Color.fromRGBO(58, 66, 86, 1.0),
                  titleText: 'Job Location',
                  dataSource: [
                    {
                      "display": "Ahmedabad",
                      "value": "Ahmedabad",
                    },
                    {
                      "display": "Assam",
                      "value": "Assam",
                    },
                    {
                      "display": "Bangalore",
                      "value": "Bangalore",
                    },
                    {
                      "display": "Chennai",
                      "value": "Chennai",
                    },
                    {
                      "display": "Mumbai",
                      "value": "Mumbai",
                    },
                    {
                      "display": "Pune",
                      "value": "Pune",
                    },
                    {
                      "display": "Kerala",
                      "value": "Kerala",
                    },
                    {
                      "display": "Kolkata",
                      "value": "Kolkata",
                    },
                    {
                      "display": "Patna",
                      "value": "Patna",
                    },
                    {
                      "display": "Raipur",
                      "value": "Raipur",
                    },
                    {
                      "display": "Panaji",
                      "value": "Panaji",
                    },
                    {
                      "display": "Jaipur",
                      "value": "Jaipur",
                    },
                    {
                      "display": "Lucknow",
                      "value": "Lucknow",
                    },
                    {
                      "display": "others",
                      "value": "others",
                    },  
                  ],
                  textField: 'display',
                  valueField: 'value',
                  okButtonLabel: 'OK',
                  cancelButtonLabel: 'CANCEL',
                  // required: true,
                  hintText: 'Please choose one or more',
                  initialValue: _location,
                  onSaved: (value) {
                    if (value == null) return;
                    setState(() {
                      _location = value;
                    });
                  },
                ),

                SizedBox(
                  height: 15.0,
                ),

                MultiSelectFormField(
                  autovalidate: false,
                  fillColor: Color.fromRGBO(58, 66, 86, 1.0),
                  titleText: 'Pay Rate',
                  dataSource: [
                    {
                      "display": "110,000-130,000 P.A",
                      "value": "110,000-130,000 P.A",
                    },
                    {
                      "display": "130,000-155,000 P.A",
                      "value": "130,000-155,000 P.A",
                    },
                    {
                      "display": "155,000-210,000 P.A",
                      "value": "155,000-210,000 P.A",
                    },
                    {
                      "display": "210,000-230,000 P.A",
                      "value": "210,000-230,000 P.A",
                    },
                    {
                      "display": "230,000-280,000 P.A",
                      "value": "230,000-280,000 P.A",
                    },
                    {
                      "display": "280,000-330,000 P.A",
                      "value": "280,000-330,000 P.A",
                    },
                    {
                      "display": "330,000-380,000 P.A",
                      "value": "330,000-380,000 P.A",
                    },
                    {
                      "display": "Above 380,000 P.A",
                      "value": "Above 380,000 P.A",
                    },  
                  ],
                  textField: 'display',
                  valueField: 'value',
                  okButtonLabel: 'OK',
                  cancelButtonLabel: 'CANCEL',
                  // required: true,
                  hintText: 'Please choose one or more',
                  initialValue: _payrate,
                  onSaved: (value) {
                    if (value == null) return;
                    setState(() {
                      _payrate = value;
                    });
                  },
                ),

                ]),
                ),

                SizedBox(
                  height: 15.0,
                ),

                Container
                (
                  height: 40.0,
                  // width: 100.0,
                  margin: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
                  child: Material
                  (
                    borderRadius: BorderRadius.circular(20.0),
                    shadowColor: Colors.yellowAccent,
                    color: Colors.yellow[400],
                    elevation: 7.0,
                    child: InkWell
                    (
                      onTap:_saveForm,
                      child: Center
                      (
                        child: Text
                        (
                          'APPLY FILTERS',
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
          ),
        ),
      ),
      ])
      );
    });
  }

  _saveForm() {
    var form = formKey.currentState;
      form.save();
      setState(() {
        _experienceResult = _experience.toString();
        _categoryResult = _category.toString();
        _locationResult = _location.toString();
        _payrateResult = _payrate.toString();
        _changes(name, age, phone, email, url,_experienceResult,_categoryResult,_locationResult,_payrateResult);
      });
  }

  void _changes(String name, String age, String phone, String email, String url,String experience, String category, String location, String pay) async 
  {
    if(experience == ''&& category == ''&& location == ''&& pay == '')
    { 
      return null;
    } 
    else 
    {
      dynamic result = await _auth.addfilter(name, age, phone, email, url, experience, category, location, pay);
      if (result == null) 
      {
        setState(() 
        {
          print("Please enter valid details");
        });
      } 
      else if (result != null) 
      {
        setState(() 
        {
          print("Data Updated");
        });
      }
    }
  }
}