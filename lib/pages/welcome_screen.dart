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
                      SizedBox(height: 20),
                      Text(
                        'Bienvenue',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontFamily: 'LufgaSemiBold',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'à votre',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontFamily: 'LufgaSemiBold',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            'EC',
                            style: TextStyle(
                              color: Colors.orange,
                              fontSize: 28,
                              fontFamily: 'LufgaSemiBold',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 2), // Espacement entre le texte et l'image
                          // Remplacez l'URL ci-dessous par l'URL de votre image SVG
                          SvgPicture.asset('assets/images/logo.svg', height: 28),
                          SizedBox(width: 10), // Espacement entre l'image et le texte
                          Text(
                            'WATT',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontFamily: 'LufgaSemiBold',
                              fontWeight: FontWeight.bold,
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
                          fontSize: 12,
                          fontFamily: 'LufgaMedium',
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
