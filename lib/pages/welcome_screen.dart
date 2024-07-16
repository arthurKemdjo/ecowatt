import 'package:flutter/material.dart';
import 'auth_pages/connection_page.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EcoWatt',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Color(0xFF121212),
            height: double.infinity,
            width: double.infinity,
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 50),
                      Text(
                        'Bienvenue',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontFamily: 'Lufga',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'à votre',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontFamily: 'Lufga',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            'EC',
                            style: TextStyle(
                              color: Colors.orange,
                              fontSize: 24,
                              fontFamily: 'Lufga',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(width: 2), // Espacement entre le texte et l'image
                          SvgPicture.asset('assets/images/logo.svg', height: 28),
                          SizedBox(width: 10), // Espacement entre l'image et le texte
                          Text(
                            'WATT',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontFamily: 'Lufga',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Image.asset(
                        'assets/images/shapes.png',
                      ),
                    ],
                  ),
                 Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ConnectionScreen()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Text('Démarrer', style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontFamily: 'Lufga',
                          fontWeight: FontWeight.w500,
                        ),),
                    ),
                    SizedBox(height: 20),
                  ],
                )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
