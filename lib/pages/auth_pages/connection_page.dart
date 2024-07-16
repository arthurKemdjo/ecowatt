import 'package:flutter/material.dart';
import 'login_page.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/gestures.dart';


class ConnectionScreen extends StatefulWidget {
  @override
  _ConnectionScreenState createState() => _ConnectionScreenState();
}

class _ConnectionScreenState extends State<ConnectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/lightbulb_background.jpg',
            fit: BoxFit.cover,
          ),
          Container(
            color: Colors.black.withOpacity(0.75), // Add a dark overlay
          ),
          SafeArea(
            child: Column(
              children: [
                SizedBox(height: 270), // Positioning ECWATT 100 units from the top
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'EC',
                          style: TextStyle(
                            color: Colors.orange,
                            fontSize: 28,
                            fontFamily: 'Lufga',
                            fontWeight: FontWeight.w600
                          ),
                        ),
                        SizedBox(width: 2),
                        SvgPicture.asset('assets/images/logo.svg', height: 28),
                        SizedBox(width: 10),
                        Text(
                          'WATT',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontFamily: 'Lufga',
                            fontWeight: FontWeight.w600
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20), // Vertical spacing between elements
                    Text(
                      'Gérez votre consommation d\'électricité \n en toute simplicité.',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontFamily: 'Lufga',
                        fontWeight: FontWeight.w300,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 50),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 40.0),
                        child: Column(
                          children: [
                            RichText(
                                text: TextSpan(
                                  children: [
                                    WidgetSpan(
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Text(
                                          'Vous ne disposez pas d\'un compte ?',
                                          style: TextStyle(
                                            fontSize: 9,
                                            color: Colors.white,
                                            fontFamily: 'Lufga',
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                    ),                  
                                    WidgetSpan(
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Text(
                                          'Créer un compte !',
                                          style: TextStyle(
                                            fontSize: 9,
                                            color: Colors.blue,
                                            fontFamily: 'Lufga',
                                            decoration: TextDecoration.underline,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Spacer(), // Pushes the content below to the bottom
                Column(
                  children: [
                      Container(
                      width: 260, // Fixed width for alignment
                      child: Column(
                        children: [
                          SizedBox(
                            width: 300.0, // Adjust as needed
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => LoginScreen()),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.orange,
                                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              child: Text(
                                'Connexion avec les identifiants',
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.white,
                                  fontFamily: 'Lufga',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                       SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                child: Divider(
                                  color: Colors.white,
                                  thickness: 1,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(
                                  'OU',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontFamily: 'Lufga',
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Divider(
                                  color: Colors.white,
                                  thickness: 1,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          OutlinedButton(
                            onPressed: () {
                              // Connexion avec Google
                            },
                            style: OutlinedButton.styleFrom(
                              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                              side: BorderSide(color: Colors.white),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  'assets/images/logo_google.svg',
                                  height: 18,
                                ),
                                SizedBox(width: 10),
                                Text(
                                  'Continuer avec Google',
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.white,
                                  fontFamily: 'Lufga',
                                  fontWeight: FontWeight.w500,
                                ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20), // Additional spacing to align the elements
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EcoWatt Home'),
      ),
      body: Center(
        child: Text('Bienvenue à la page d\'accueil de EcoWatt!'),
      ),
    );
  }
}
