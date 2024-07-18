import 'package:ecowatt/pages/home_page.dart';
import 'package:flutter/material.dart';

class ControlScreen extends StatefulWidget {
  const ControlScreen({super.key});

  @override
  _ControlScreenState createState() => _ControlScreenState();
}

class _ControlScreenState extends State<ControlScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Center(
          child: Text(
            'Control',
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Appareils actuellement actifs',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 8),
            _buildDeviceRow('Light Bulb 50Wh', 'Supprimer', 'Alarme'),
            _buildDeviceRow('Hisense LCD TV', 'Supprimer', 'Alarme'),
            _buildDeviceRow('Daikin Climatiseur', 'Supprimer', 'Alarme'),
            SizedBox(height: 20),
            Text(
              'Programmer',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            _buildProgramSection(),
            SizedBox(height: 20),
            Text(
              'Reglages',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            _buildSettingsSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildDeviceRow(String deviceName, String button1, String button2) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(deviceName),
        Row(
          children: [
            ElevatedButton(
              onPressed: () {},
              child: Text(button1),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            ),
            Switch(value: true, onChanged: (value) {}),
          ],
        ),
      ],
    );
  }

  Widget _buildProgramSection() {
    return Container(
      padding: EdgeInsets.all(16),
      color: Colors.blue.withOpacity(0.1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Définir les jours'),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildDayButton('Lun'),
              _buildDayButton('Mar'),
              _buildDayButton('Mer'),
              _buildDayButton('Jeu'),
              _buildDayButton('Ven'),
              _buildDayButton('Sam'),
              _buildDayButton('Dim'),
            ],
          ),
          SizedBox(height: 16),
          Text('Horaire'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildTimeInput('De'),
              Text(':'),
              _buildTimeInput('12:30'),
              Text('à'),
              _buildTimeInput('15:40'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsSection() {
    return Container(
      padding: EdgeInsets.all(16),
      color: Colors.blue.withOpacity(0.1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Couleur'),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildColorButton(Colors.yellow),
              _buildColorButton(Colors.black),
              _buildColorButton(Colors.blue),
            ],
          ),
          SizedBox(height: 16),
          Text('Luminosité'),
          Slider(value: 0.5, onChanged: (value) {}),
        ],
      ),
    );
  }

  Widget _buildDayButton(String day) {
    return ElevatedButton(
      onPressed: () {},
      child: Text(day),
    );
  }

  Widget _buildTimeInput(String time) {
    return Container(
      padding: EdgeInsets.all(8),
      color: Colors.white,
      child: Text(time),
    );
  }

  Widget _buildColorButton(Color color) {
    return Container(
      width: 30,
      height: 30,
      color: color,
    );
  }
}

