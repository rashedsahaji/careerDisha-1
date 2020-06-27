import 'package:careerdisha/screens/homepage.dart';
import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'jobsearch.dart';
import 'logout.dart';
import 'notification.dart';
import 'userinfo.dart';

class Navigate extends StatefulWidget 
{
  Navigate({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _NavigateState createState() => _NavigateState();
}

class _NavigateState extends State<Navigate> 
{
  int selectedIndex = 2;
  final _pageoptions = [ SearchJobs(), Noti(), AppHome(), UserInfo(), Logout()];

  @override
  Widget build(BuildContext context) 
  {
    return Scaffold
    (
      body: _pageoptions[selectedIndex],
      bottomNavigationBar: FFNavigationBar
      (
        theme: FFNavigationBarTheme(
          barBackgroundColor: Colors.yellow[400],
          selectedItemBorderColor: Colors.white,
          selectedItemBackgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
          selectedItemIconColor: Colors.yellow[400],
          selectedItemLabelColor: Color.fromRGBO(58, 66, 86, 1.0),
          unselectedItemIconColor: Color.fromRGBO(58, 66, 86, 1.0), 
          unselectedItemLabelColor: Color.fromRGBO(58, 66, 86, 1.0), 
          showSelectedItemShadow: false,
          barHeight: 55,
        ),
        selectedIndex: selectedIndex,
        onSelectTab: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: [
          
          FFNavigationBarItem(
            iconData: Icons.search,
            itemWidth: 50,
            label: 'Search',
          ),
          FFNavigationBarItem(
            iconData: Icons.notifications,
            label: 'Notification',
          ),
          FFNavigationBarItem(
            iconData: Icons.home,
            label: 'Home',
          ),
          FFNavigationBarItem(
            iconData: Icons.person,
            label: 'Profile',
          ),
          FFNavigationBarItem(
            iconData: Icons.exit_to_app,
            label: 'Logout',
            selectedBackgroundColor: Colors.red,
          ),
        ],
      ),
    );
  }
}
