import 'package:ecowatt/pages/home_page.dart';
import 'package:flutter/material.dart';
class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Center(
          child: Text(
            'Rechercher',
            style: TextStyle(
              color: Colors.black,
              fontFamily: "Inter",
              fontWeight: FontWeight.w700,
              fontSize: 14,
            ),
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.chevron_left),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => MainScreen()),
              (Route<dynamic> route) => false,
            );
          },
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(0.5),
          child: Container(
            color: Color(0xFFE6E6E6),
            height: 0.5,
          ),
        ),
      ),

       body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Center(
              child: Column(
                children: [
                  Icon(Icons.wifi_off, size: 100),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Ajouter un appareil'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            _buildDeviceSection('Appareils actuellement actifs',
                ['Light Bulb 50Wh', 'Hisense LCD TV', 'Daikin Climatiseur']),
            SizedBox(height: 20),
            _buildDeviceSection('Appareils récemment connectés',
                ['Light Bulb 50Wh', 'Hisense LCD TV', 'Daikin Climatiseur']),
            SizedBox(height: 20),
            _buildDeviceSection(
                'Appareils trouvés', ['Light Bulb 50Wh', 'Hisense LCD TV']),
          ],
        ),
      ),
    );
  }

  Widget _buildDeviceSection(String title, List<String> devices) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        SizedBox(height: 8),
        ...devices.map((device) => _buildDeviceRow(device)).toList(),
      ],
    );
  }

  Widget _buildDeviceRow(String deviceName) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(deviceName),
        Row(
          children: [
            ElevatedButton(
              onPressed: () {},
              child: Text(
                'Connecter',
                style: TextStyle(fontSize: 10), // Taille du texte
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                minimumSize: Size(10, 20), // Largeur et hauteur du bouton
              ),
            ),
          ],
        ),
      ],
    );
  }
}
