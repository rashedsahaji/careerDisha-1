import 'package:careerdisha/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'database.dart';

class AuthService
{
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create user obj based on FirebaseUser
  User _userFromFirebase (FirebaseUser user){
    return user != null ? User(uid: user.uid):null;
  }

  // auth change user stream
  Stream<User> get user{
    return _auth.onAuthStateChanged
        //.map((FirebaseUser user) => _userFromFirebase(user));
    .map(_userFromFirebase);
  }

  //anon
  Future signInAnon() async
  {
  try
  {
    AuthResult result = await _auth.signInAnonymously();
    FirebaseUser user = result.user;
    return _userFromFirebase(user);
  } catch(e){
    print(e.toString());
    return null;
   }
  }


  //sign in email pass
   static var useremail;
  Future signInWithEmailAndPassword(String email, String password) async
  {
    try
    {
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      useremail=user.uid;
      return _userFromFirebase(user);
    }
    catch(e)
    {
      print(e.toString());
      return null;
    }
  }

    
  //Registering data
  Future register(String name, String age, String phone, String email, String password) async
  {
    try
    {
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      if(user!=null)
      {
        String url='';
        String experience='';
        String category='';
        String location='';
        String pay='';

        await emailid(email);
        // Registering user data
        await DatabaseService(userid: user.uid).updateUserData(name,age,phone,email,url,experience,category,location,pay);
      }
      return _userFromFirebase(user);
    }

    catch(e)
    {
      print(e.toString());
      return null;
    }
  }

  
  // Email notification
  emailid(String email)async
  {
    String username = 'careerdishaindia2020@gmail.com';
    String password = '9432329948';

    final smtpServer = gmail(username, password);
  
    final message = Message()
    ..from = Address(username, 'CareerDisha')
    ..recipients.add(email)
    // ..ccRecipients.addAll(['roysanju1107@gmail.com', 'rashedsahaji@gmail.com', 'digiabhi1999@gmail.com', 'indranisingharoy918@gmail.com'])
    // ..bccRecipients.add(Address('bccAddress@example.com'))
    ..subject = 'Career Disha '//:: 😀 :: ${DateTime.now()}'
    // ..text = 'You have recieved this email because you are registered with CareerDisha'
    ..html = "<h1>Welcome</h1> \n <h6> You have recieved this email because you are registered with CareerDisha</h6>";

  try 
  {
      final sendReport = await send(message, smtpServer);
      print('Message sent: ' + sendReport.toString());
  } 
  on MailerException catch (e) 
  {
      print('Message not sent.');
      for (var p in e.problems) {
      print('Problem: ${p.code}: ${p.msg}');
    }
  }
  // DONE
  
    var connection = PersistentConnection(smtpServer);
  
    // Send the message
    await connection.send(message);
  
    // close the connection
    await connection.close();
  }



  //update data
  var uid;
  Future editUser(String name, String age, String phone, String email, String url) async
  {
    try
    {
      print(age);
      print(email);
      print(phone);
      print(name);
      // updating user data
      var result = await _auth.currentUser();
      FirebaseUser user = result;
      if(user!=null)
      {
        await DatabaseService(userid: user.uid).updateUserdetails(name,age,phone,email,url);
      }
      return _userFromFirebase(user);
    }
    catch(e)
    {
      print(e.toString());
      return null;
    }
  }

  Future addfilter(String name, String age, String phone, String email, String url, String experience, String category, String location, String pay) async
  {
    try
    {
      // print(age);
      // print(email);
      // print(phone);
      // print(name);
      // updating user data
      var result = await _auth.currentUser();
      FirebaseUser user = result;
      if(user!=null)
      {
        await DatabaseService(userid: user.uid).updatefilter(name,age,phone,email,url,experience,category,location,pay);
      }
      return _userFromFirebase(user);
    }
    catch(e)
    {
      print(e.toString());
      return null;
    }
  }


  //sign out
  Future signOut() async
  {
    try{
      return await _auth.signOut();
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  //forgot password
  Future searchEmail(String email) async
  {
    try
    {
      await _auth.sendPasswordResetEmail(email: email);

      return 'Mail Sent';
    }
    catch(e)
    {
      print(e.toString());
      return null;
    }
  }
}