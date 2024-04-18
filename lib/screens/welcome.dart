import 'package:cut_guider/screens/home.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // Center all content

        //padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Image.asset(
              'assets/images/logo.png',
              width: double.infinity,
              alignment: Alignment.topCenter,
            ),
            const SizedBox(height: 3.0),
            // Logo and text at center left
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 35,
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // Welcome text
                  Text(
                    'Welcome to',
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                  Text(
                    'CutGuider',
                    style:
                        TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  // Subtext
                  Text(
                    'Best stock cutting calculator platform',
                    style: TextStyle(fontSize: 14.0, color: Colors.grey),
                  ),
                  Text(
                    'for all individuals.',
                    style: TextStyle(fontSize: 14.0, color: Colors.grey),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40.0),
            // Sign in button
            Expanded(
                child: Column(
              children: [
                ElevatedButton.icon(
                  icon: const Icon(Icons.arrow_right_alt),
                  onPressed: () {
                     Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeScreen()),
                    );
                    // Handle sign in button press
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    minimumSize: const Size(340, 50),
                    //minimumSize: const Size(double.infinity, 60.0),
                  ),
                  label:
                      const Text('Sign in', style: TextStyle(fontSize: 20.0)),
                ),
                const SizedBox(height: 16.0),
                // Sign up button
                ElevatedButton.icon(
                  icon: const Icon(Icons.arrow_right_alt),
                  onPressed: () {
                   
                    // Handle sign up button press
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    minimumSize: const Size(340, 50.0),
                  ),
                  label:
                      const Text('Sign up', style: TextStyle(fontSize: 20.0)),
                ),
                const SizedBox(height: 24.0),
                // 3rd party login buttons in different rows, in the middle
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // Google login button
                    ElevatedButton.icon(
                      onPressed: () {
                        // Handle Google login
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        minimumSize: const Size(250.0, 40.0),
                      ),
                      icon: const Icon(Icons.g_translate, color: Colors.white),
                      label: const Text('Google',
                          style:
                              TextStyle(fontSize: 16.0, color: Colors.white)),
                    ),
                  ],
                ),
                const SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // Twitter login button
                    ElevatedButton.icon(
                      onPressed: () {
                        // Handle Twitter login
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.lightBlue,
                        minimumSize: const Size(250.0, 40.0),
                      ),
                      icon: const Icon(Icons.trending_up, color: Colors.white),
                      label: const Text('Twitter',
                          style:
                              TextStyle(fontSize: 16.0, color: Colors.white)),
                    ),
                  ],
                ),
                const SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // Instagram login button
                    ElevatedButton.icon(
                      onPressed: () {
                        // Handle Instagram login
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        minimumSize: const Size(250.0, 40.0),
                      ),
                      icon: const Icon(Icons.camera, color: Colors.white),
                      label: const Text('Instagram',
                          style:
                              TextStyle(fontSize: 16.0, color: Colors.white)),
                    ),
                  ],
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
