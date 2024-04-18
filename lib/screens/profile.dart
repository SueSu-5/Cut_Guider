
import 'package:cut_guider/screens/home.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                 Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomeScreen()),
                    );
                // Handle back button press
              },
            );
          },
        ),
        title: const Text(
          'My Profile',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        // actions: [
        //   IconButton(
        //     icon: Icon(Icons.more_vert),
        //     onPressed: () {
        //       // Handle more button press
        //     },
        //   ),
        //   // "..." button at top-right
        // ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
            ),
            // Larger profile card, across the screen
            const Card(
              elevation: 1.0,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    // First row: self photo in circle
                    CircleAvatar(
                      radius: 70.0,
                      backgroundImage: AssetImage(
                          'assets/self_photo.jpg'), // Replace with your image
                    ),
                    SizedBox(height: 8.0),
                    // Second row: Name
                    Text(
                      "User Name",
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8.0),
                    // Third row: Position
                    Text(
                      "Position: Your Position",
                      style: TextStyle(fontSize: 18.0),
                    ),
                    SizedBox(height: 8.0),
                    // Fourth row: Description
                    Text(
                      "Description: Your Description",
                      style: TextStyle(fontSize: 14.0),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            // "My Projects" text at left
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Favorite Projects",
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 12.0),
            Expanded(
              child: GridView(
                padding: const EdgeInsetsDirectional.all(24),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.5,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
                children: [
                 // for (final file in _registeredProjects) file,
                ],
              ),
            ),
            // Project files with icons, names, and creation dates
            // Spacer to push everything to the top
          ],
        ),
      ),
    );
  }
}
