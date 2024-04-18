

import 'package:cut_guider/screens/password.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: SettingsPage(),
  ));
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          //mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Settings',
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 50.0),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ChangePasswordPage()));
                // Add functionality for Change Password button
              },
              child: Text(
                'Change Password',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Text(
                    'Enable Fingerprint or FaceID',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                Switch(
                  value: true, // Set the initial value of the switch
                  onChanged: (value) {
                    // Add functionality for enabling/disabling fingerprint or FaceID
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
