import 'package:careerdisha/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService
{
  final String userid;

  DatabaseService({this.userid});

  // collection reference
  final CollectionReference careerDisha = Firestore.instance.collection('users');

  Future updateUserData(String name,String age,String phone,String email,String url, String experience, String category, String location, String pay) async
  {
    return await careerDisha.document(userid).setData({
      'name': name,
      'age':age,
      'phone':phone,
      'email':email,
      'url':url,
      'experience':experience,
      'category':category,
      'location':location,
      'pay':pay,
    });
  }

  Future updateUserdetails(String name,String age,String phone,String email,String url) async
  {
    return await careerDisha.document(userid).setData({
      'name': name,
      'age':age,
      'phone':phone,
      'email':email,
      'url':url,
    });
  }

Future updatefilter(String name,String age,String phone,String email,String url,String experience,String category,String location,String pay) async
  {
    return await careerDisha.document(userid).setData({
      'name': name,
      'age':age,
      'phone':phone,
      'email':email,
      'url':url,
      'experience': experience,
      'category': category,
      'location': location,
      'pay': pay,
    });
  }


  //get user data
  UserData _userDatafromsnapshot(DocumentSnapshot snapshot)
  {
    return UserData
      (
      userid:userid,
      name:snapshot.data['name'],
      age:snapshot.data['age'],
      phone:snapshot.data['phone'],
      email:snapshot.data['email'],
      url:snapshot.data['url'],
      experience:snapshot.data['experience'],
      category:snapshot.data['category'],
      location:snapshot.data['location'],
      pay:snapshot.data['pay'],
    );
  }

  Stream<UserData> get users
  {
    return careerDisha.document(userid).snapshots().map(_userDatafromsnapshot);
  }
}