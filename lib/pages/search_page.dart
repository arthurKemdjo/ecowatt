import 'package:ecowatt/pages/home_page.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool isDeviceOn = true;
  Map<String, bool> deviceStates = {
    'Light Bulb 50Wh': true,
    'Hisense LCD TV': true,
    'Daikin Climatiseur': true,
  };
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Center(
                child: Column(
                  children: [
                    Icon(Icons.wifi_off, size: 100, color: Color(0XFF2C80F0)),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0XFF2C80F0),
                        padding:
                            EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        'Ajouter un appareil',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontFamily: 'Lufga',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 26),
              _buildDeviceSection(
                  'Appareils actuellement actifs',
                  ['Light Bulb 50Wh', 'Hisense LCD TV', 'Daikin Climatiseur'],
                  true),
              Divider(
                color: Color(0xFFE6E6E6),
                height: 0.5,
              ),
              SizedBox(height: 20),
              _buildDeviceSection(
                  'Appareils récemment connectés',
                  ['Light Bulb 50Wh', 'Hisense LCD TV', 'Daikin Climatiseur'],
                  false),
              Divider(
                color: Color(0xFFE6E6E6),
                height: 0.5,
              ),
              SizedBox(height: 20),
              _buildFoundDeviceSection(
                  'Appareils trouvés', ['Light Bulb 50Wh', 'Hisense LCD TV']),
              Divider(
                color: Color(0xFFE6E6E6),
                height: 0.5,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDeviceSection(
      String title, List<String> devices, bool withSwitch) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 14,
            color: Color(0XFF2E4145),
            fontFamily: 'Lufga',
            fontWeight: FontWeight.w800,
          ),
        ),
        SizedBox(height: 8),
        ...devices
            .map((device) => withSwitch
                ? _buildActiveDeviceRow(device)
                : _buildRecentDeviceItem(device))
            .toList(),
      ],
    );
  }

  Widget _buildFoundDeviceSection(String title, List<String> devices) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 14,
            color: Color(0XFF2E4145),
            fontFamily: 'Lufga',
            fontWeight: FontWeight.w800,
          ),
        ),
        SizedBox(height: 8),
        ...devices
            .map((device) => Column(
                  children: [
                    _buildDeviceRow(device),
                    SizedBox(height: 8), // Ajoute un espace entre les appareils
                  ],
                ))
            .toList(),
      ],
    );
  }

  Widget _buildActiveDeviceRow(String deviceName) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          deviceName,
          style: TextStyle(
            fontSize: 12,
            color: Color(0XFF808080),
            fontFamily: 'Lufga',
          ),
        ),
        Row(
          children: [
            Text(
              deviceStates[deviceName] ?? false ? 'Allumé' : 'Éteint',
              style: TextStyle(
                fontSize: 12,
                color: Color(0XFF808080),
                fontFamily: 'Lufga',
              ),
            ),
            Switch(
              value: deviceStates[deviceName] ?? false,
              onChanged: (bool value) {
                setState(() {
                  deviceStates[deviceName] = value;
                });
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildRecentDeviceItem(String deviceName) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          deviceName,
          style: TextStyle(
            fontSize: 12,
            color: Color(0XFF808080),
            fontFamily: 'Lufga',
          ),
        ),
      ),
    );
  }

  Widget _buildDeviceRow(String deviceName) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          deviceName,
          style: TextStyle(
            fontSize: 12,
            color: Color(0XFF808080),
            fontFamily: 'Lufga',
          ),
        ),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orange,
          ),
          child: Text(
            'Connecter',
            style: TextStyle(
              fontSize: 12,
              color: Colors.white,
              fontFamily: 'Lufga',
            ),
          ),
        ),
      ],
    );
  }
}
