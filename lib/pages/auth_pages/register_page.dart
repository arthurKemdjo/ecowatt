import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../home_page.dart';



class RegisterScreen extends StatefulWidget {
  @override
   _RegisterScreenState createState() => _RegisterScreenState();
}

class RegistercreenState {
}

class _RegisterScreenState extends State<RegisterScreen> {
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
          ),
          Container(
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
                            fontWeight: FontWeight.w600),
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
                            fontWeight: FontWeight.w600),
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
                                  'Créer votre compte pour \n gérer vos appareils connectés',
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
                      SizedBox(height: 30),
                      TextField(
                        controller: _usernameController,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person, color: Colors.white, size: 20,),
                          hintText: 'Nom d\'utilisateur',
                          hintStyle:
                              TextStyle(color: Color(0xFF8A8686), fontSize: 10),
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.1),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                                color: Colors.white,
                                width: 0.5), // Bordure blanche
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                                color: Colors.white,
                                width: 0.5), // Bordure blanche
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                                color: Colors.white,
                                width: 0.5), // Bordure blanche
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10),
                        ),
                      ),
                      SizedBox(height: 30),
                      TextField(
                        controller: _passwordController,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock, color: Colors.white, size: 16,),
                          hintText: 'Mot de passe',
                          hintStyle:
                              TextStyle(color: Color(0xFF8A8686), fontSize: 10),
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.1),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                                color: Colors.white,
                                width: 0.5), // Bordure blanche
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                                color: Colors.white,
                                width: 0.5), // Bordure blanche
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                                color: Colors.white,
                                width: 0.5), // Bordure blanche
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10),
                        ),
                      ),
                      SizedBox(height: 30),
                      TextField(
                        controller: _passwordController,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock, color: Colors.white, size: 16,),
                          hintText: 'Confirmation du mot de passe',
                          hintStyle:
                              TextStyle(color: Color(0xFF8A8686), fontSize: 10),
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.1),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                                color: Colors.white,
                                width: 0.5), // Bordure blanche
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                                color: Colors.white,
                                width: 0.5), // Bordure blanche
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                                color: Colors.white,
                                width: 0.5), // Bordure blanche
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10),
                        ),
                      ),

                      SizedBox(height: 50),
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
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                MainScreen()),
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.orange,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 32, vertical: 12),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                    child: Text(
                                      'S\'inscrire',
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.white,
                                        fontFamily: 'Lufga',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 4),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Divider(
                                        color: Colors.white,
                                        thickness: 1,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
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
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 32, vertical: 12),
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
                                // SizedBox(height: 20),
                              ],
                            ),
                          ),
                        ],
                      ),
                
                      // SizedBox(
                      //   height: 24,
                      // ),
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
