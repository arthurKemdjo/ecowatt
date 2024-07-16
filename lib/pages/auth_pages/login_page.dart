import 'package:ecowatt/pages/auth_pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../home_page.dart';



class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/light.jpg',
            fit: BoxFit.cover,
          ),Container(
            color: Colors.black.withOpacity(0.8),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'EC',
                          style: TextStyle(
                            color: Colors.orange,
                            fontSize: 18,
                            fontFamily: 'Lufga',
                            fontWeight: FontWeight.w600
                          ),
                        ),
                        SizedBox(width: 2),
                        SvgPicture.asset('assets/images/logo.svg', height: 28),
                        SizedBox(width: 5),
                        Text(
                          'WATT',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: 'Lufga',
                            fontWeight: FontWeight.w600
                          ),
                        ),
                      ],
                    ),
                  SizedBox(height: 80),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                        RichText(
                                text: TextSpan(
                                  children: [
                                    WidgetSpan(
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'Bienvenue',
                                          style: TextStyle(
                                            fontSize: 24,
                                            color: Colors.orange,
                                            fontFamily: 'Lufga',
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                    ),                  
                                    WidgetSpan(
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'parmis nous !',
                                          style: TextStyle(
                                            fontSize: 24,
                                            color: Colors.white,
                                            fontFamily: 'Lufga',
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                      SizedBox(height: 20),

                      RichText(
                                text: TextSpan(
                                  children: [
                                    WidgetSpan(
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'Connectez-vous à votre compte',
                                          style: TextStyle(
                                            fontSize: 11,
                                            color: Colors.white,
                                            fontFamily: 'Lufga',
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ), 
                                  ],
                                ),
                              ),
                      SizedBox(height: 60),
                      TextField(
                        controller: _usernameController,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person, color: Colors.black),
                          hintText: 'Nom d\'utilisateur',
                          hintStyle: TextStyle(color: Color(0xFF8A8686), fontSize: 10),
                          filled: true,
                          fillColor: Colors.white.withOpacity(1),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                        ),
                      ),
                      SizedBox(height: 40),
                       TextField(
                        controller:  _passwordController,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock, color: Colors.black),
                          hintText: 'Mot de passe',
                          hintStyle: TextStyle(color: Color(0xFF8A8686), fontSize: 10),
                          filled: true,
                          fillColor: Colors.white.withOpacity(1),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                        ),
                      ),
                      SizedBox(height: 70),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(builder: (context) => MainScreen()),
                            (route) => false,);

                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                          textStyle: TextStyle(fontSize: 12, color: Colors.white, fontFamily: "Lufga", fontWeight:FontWeight.w600,),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: Text('Connexion'),
                      ),
                      SizedBox(height: 24,),
                      // TextButton(onPressed: () {
                      //   Navigator.push(
                      //     context,
                      //     MaterialPageRoute(builder: (context) => RegisterScreen()),
                      //   );
                      // }, child: Text("Register "))
                    ],
                  ),
                ],
              ),
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
        title: Text('Accueil EcoWatt'),
      ),
      body: Center(
        child: Text('Bienvenue à la page d\'accueil de EcoWatt!'),
      ),
    );
  }
}


