import 'package:cut_guider/screens/profile.dart';
import 'package:cut_guider/screens/settings.dart';
import 'package:flutter/material.dart';

class SideMenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Scaffold(
        backgroundColor: Color.fromARGB(59, 249, 245, 245).withOpacity(0.95),
        appBar: AppBar(
          //backgroundColor: Color.fromARGB(59, 249, 245, 245).withOpacity(0.95),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(80),
          ),
          leadingWidth: 300,
          toolbarHeight: 120,
          automaticallyImplyLeading: true,
          leading: Container(
            width: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20.0),
              ),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/user_photo.png'),
                  ),
                  SizedBox(width: 10.0),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'User Name',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'User Location',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
        body: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 30,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Semi-square circle at top left

              SizedBox(height: 120.0),
              // Text buttons
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  // Add functionality for Home button
                },
                child: Text(
                  'Home',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 28,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextButton(
                onPressed: () {
                   Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ProfilePage(),
                  ));
                },
                child: Text(
                  'Profile',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 28,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => SettingsPage(),
                  ));
                  // Add functionality for Settings button
                },
                child: Text(
                  'Settings',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 28,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextButton(
                onPressed: () {
                 
                  // Add functionality for Help button
                },
                child: Text(
                  'Help',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 28,
                  ),
                ),
              ),
              Spacer(),
              // Logout button with icon
              Row(
                children: [
                  Icon(Icons.logout, color: Colors.black),
                  SizedBox(width: 10.0),
                  TextButton(
                    onPressed: () {
                      // Add functionality for Logout button
                    },
                    child: Text(
                      'Logout',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
