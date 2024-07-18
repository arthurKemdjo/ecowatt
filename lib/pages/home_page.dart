import 'package:ecowatt/pages/control_page.dart';
import 'package:ecowatt/pages/search_page.dart';
import 'package:ecowatt/pages/setting_page.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

const List<String> dropdownItems = ['Jour', 'Semaine', 'Mois'];

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const DashboardScreen(),
    const SearchScreen(),
    const ControlScreen(),
    const SettingsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Accueil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Recherche',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.control_camera),
            label: 'Control',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Paramètres',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 30),
              const Padding(
                padding: EdgeInsets.only(left: 6),
                child: Row(
                  children: [
                    Text(
                      'Hello, ',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Lufga',
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      'Jane Doe',
                      style: TextStyle(
                        color: Colors.orange,
                        fontFamily: 'Lufga',
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(width: 10),
                    Spacer(),
                    CircleAvatar(
                      radius: 14,
                      backgroundImage: AssetImage('assets/images/profile.jpg'),
                    ),
                    SizedBox(width: 10),
                    Icon(
                      Icons.notifications,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),
              // Today's, Week's, and Month's consumption
              Center(
                child: ConsommationWidget(),
              ),
              const SizedBox(height: 20),
              // Two containers side by side
              Row(
                children: [
                  Expanded(
                    child: _buildLimitCard(),
                  ),
                  const SizedBox(width: 6),
                  Expanded(
                    child: _buildAddDeviceCard(),
                  ),
                ],
              ),

              const SizedBox(height: 20),
              _buildSettingsCard(),
              const SizedBox(height: 10),
              Center(
                child: _buildScheduleCard(),
              ),
              const SizedBox(height: 10),
              Center(
                child: _buildNotificationsCard(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildConsumptionCard(String title, String consumption, Color color) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4.0),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 10,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              consumption,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLimitCard() {
    return Container(
      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
      decoration: BoxDecoration(
        color: Colors.orange.withOpacity(0.1),
        borderRadius: BorderRadius.circular(32.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: 52,
                margin: EdgeInsets.only(right: 10),
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Color(0xFFFFA500),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  'Aujourd\'hui',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 6,
                    fontFamily: 'Lufga',
                    fontWeight: FontWeight.w200,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 2),
          SizedBox(
            height: 100,
            child: SfRadialGauge(
              axes: <RadialAxis>[
                RadialAxis(
                  minimum: 0,
                  maximum: 100,
                  showLabels: false,
                  showTicks: false,
                  startAngle: 180,
                  endAngle: 0,
                  radiusFactor: 0.8,
                  axisLineStyle: AxisLineStyle(
                    thickness: 0.1,
                    color: Color.fromARGB(255, 255, 255, 255).withOpacity(1),
                    thicknessUnit: GaugeSizeUnit.factor,
                  ),
                  pointers: <GaugePointer>[
                    RangePointer(
                      value: 75,
                      width: 0.1,
                      sizeUnit: GaugeSizeUnit.factor,
                      color: Colors.orange,
                      cornerStyle: CornerStyle.bothCurve,
                    ),
                  ],
                  annotations: <GaugeAnnotation>[
                    GaugeAnnotation(
                      widget: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '55%',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            'de la limite atteinte',
                            style: TextStyle(
                              fontSize: 8,
                              fontFamily: 'Lufga',
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      angle: 90,
                      positionFactor: 0.5,
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 2),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 116,
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFFFA500),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text(
                      'Définir une limite',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Lufga',
                        fontSize: 8,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddDeviceCard() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: const Color(0xFFE6F3FF),
        borderRadius: BorderRadius.circular(32.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 24,
                width: 24,
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Color(0xFF2E4145),
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.add, color: Colors.white, size: 8),
              ),
            ],
          ),
          SizedBox(height: 16), // Espacement entre les éléments
          Text(
            'Bienvenue dans ECOWATT',
            style: TextStyle(
              color: Color(0xFF2E4145),
              fontSize: 10,
              fontFamily: 'Lufga',
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center, // Centrer le texte
          ),
          SizedBox(height: 8), // Espacement entre les éléments
          Text(
            'Ajoutez des appareils connectés et gérez votre consommation en toute simplicité',
            style: TextStyle(
              color: Color(0xFF808080),
              fontSize: 8,
              fontFamily: 'Lufga',
              fontWeight: FontWeight.w300,
            ),
            textAlign: TextAlign.center, // Centrer le sous-texte
          ),
          SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0XFFFF3D00),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(60),
                ),
              ),
              child: Text(
                'Ajouter un appareil',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 8,
                  fontFamily: 'Lufga',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsCard() {
    return Container(
      padding: const EdgeInsets.only(top: 1.0, left: 4.0, right: 4.0),
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 120,
                      margin: EdgeInsets.only(left: 4, top: 1),
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Color(0xFF2C80F0),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Appareil actuel : ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 6,
                                fontFamily: 'Lufga',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: 'Light Bulb 50Wh',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 6,
                                fontFamily: 'Lufga',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4),
                Padding(
                  padding: EdgeInsets.only(left: 6.0), // Add left padding
                  child: Text(
                    'Réglages et paramètres',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 8,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    Icons.color_lens,
                    size: 16,
                    color: Colors.white,
                  ),
                  label: Text(
                    'Modifier la couleur',
                    style: TextStyle(
                        fontSize: 7,
                        color: Colors.white,
                        fontFamily: 'Lufga',
                        fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF2E4145),
                    minimumSize: Size(30, 32),
                  ),
                ),
                SizedBox(height: 12),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    Icons.wb_sunny,
                    size: 16,
                    color: Colors.white,
                  ),
                  label: Text(
                    'Modifier la luminosité',
                    style: TextStyle(
                        fontSize: 6,
                        color: Colors.white,
                        fontFamily: 'Lufga',
                        fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF1E628D),
                    minimumSize: Size(30, 32),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Résumé de l\'utilisation',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 8,
                      ),
                    ),
                    DropdownMenuExample(),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Énergie consommée',
                          style: TextStyle(
                              fontSize: 7,
                              fontFamily: 'Lufga',
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '17 Jun - 23 Jun',
                          style: TextStyle(
                              fontSize: 6,
                              color: Colors.grey[600],
                              fontFamily: 'Lufga',
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Text(
                      '74.92 kWh',
                      style: TextStyle(
                        fontFamily: 'Lufga',
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
                Divider(
                  color: Colors.white.withOpacity(0.4),
                  thickness: 1.5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Énergie économisée',
                          style: TextStyle(
                              fontSize: 7,
                              fontFamily: 'Lufga',
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '17 Jun - 23 Jun',
                          style: TextStyle(
                              fontSize: 6,
                              color: Colors.grey[600],
                              fontFamily: 'Lufga',
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Text(
                      '22.38 kWh',
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 10,
                        fontFamily: 'Lufga',
                      ),
                    ),
                  ],
                ),
                Divider(
                  color: Colors.white.withOpacity(0.4),
                  thickness: 1.5,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ConsommationWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      borderType: BorderType.RRect,
      radius: const Radius.circular(20),
      padding: const EdgeInsets.all(6),
      color: const Color(0xFF2C80F0),
      strokeWidth: 1,
      dashPattern: [6, 3],
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildConsommationItem("Aujourd'hui", "17.92 kWh", Colors.orange),
            _buildVerticalDivider(),
            _buildConsommationItem("Semaine", "74.92 kWh", Colors.blue),
            _buildVerticalDivider(),
            _buildConsommationItem("Mois", "664.92 kWh", Colors.red),
          ],
        ),
      ),
    );
  }

  Widget _buildConsommationItem(String title, String value, Color valueColor) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 12,
            fontFamily: 'Lufga',
            fontWeight: FontWeight.w600,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          value,
          style: TextStyle(
            fontSize: 10,
            fontFamily: 'Lufga',
            fontWeight: FontWeight.w600,
            color: valueColor,
          ),
        ),
      ],
    );
  }

  Widget _buildVerticalDivider() {
    return Container(
      height: 40,
      width: 1,
      color: const Color.fromARGB(255, 255, 255, 255),
    );
  }
}

class DropdownMenuExample extends StatefulWidget {
  const DropdownMenuExample({Key? key}) : super(key: key);

  @override
  _DropdownMenuExampleState createState() => _DropdownMenuExampleState();
}

class _DropdownMenuExampleState extends State<DropdownMenuExample> {
  String dropdownValue = dropdownItems.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      items: dropdownItems.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value,
              style: TextStyle(
                  fontSize: 7,
                  fontFamily: 'Lufga',
                  fontWeight: FontWeight.bold)),
        );
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
    );
  }
}

Widget _buildSettingSlider(String label) {
  return Column(
    children: [
      Text(label),
      Slider(
        value: 0.4,
        onChanged: (value) {},
      ),
    ],
  );
}

Widget _buildConsumptionAndThemeCard() {
  return Container(
    padding: const EdgeInsets.all(16.0),
    decoration: BoxDecoration(
      color: Colors.yellow.withOpacity(0.1),
      borderRadius: BorderRadius.circular(12.0),
    ),
    child: const Column(
      children: [
        Text('Consommation par appareil'),
        SizedBox(height: 20),
        Text('Paramètres du thème'),
      ],
    ),
  );
}

Widget _buildScheduleCard() {
  return Container(
    margin: EdgeInsets.only(top: 10.0),
    padding: EdgeInsets.all(16.0),
    decoration: BoxDecoration(
      color: Color(0xFF2E4145),
      borderRadius: BorderRadius.circular(20.0),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Plannifier vos horaires',
              style: TextStyle(
                fontFamily: 'Lufga',
                fontSize: 8,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text('Plannifier',
                  style: TextStyle(
                    fontFamily: 'Lufga',
                    fontSize: 8,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  )),
            ),
          ],
        ),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Créneau horaire :',
              style: TextStyle(
                fontFamily: 'Lufga',
                fontSize: 8,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              'De ',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 8,
                  fontFamily: 'Lufga',
                  fontWeight: FontWeight.bold),
            ),
            Text(
              '16:00',
              style: TextStyle(
                  color: Colors.orange,
                  fontSize: 8,
                  fontFamily: 'Lufga',
                  fontWeight: FontWeight.bold),
            ),
            Text(
              ' A ',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 8,
                  fontFamily: 'Lufga',
                  fontWeight: FontWeight.bold),
            ),
            Text(
              '17:00',
              style: TextStyle(
                  color: Colors.orange,
                  fontSize: 8,
                  fontFamily: 'Lufga',
                  fontWeight: FontWeight.bold),
            ),
            Text(
              'Periode',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 8,
                  fontFamily: 'Lufga',
                  fontWeight: FontWeight.bold),
            ),
            Text(
              'Lun-Mar',
              style: TextStyle(
                  color: Colors.orange,
                  fontSize: 8,
                  fontFamily: 'Lufga',
                  fontWeight: FontWeight.bold),
            ),
            Text(
              'Status :',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 8,
                  fontFamily: 'Lufga',
                  fontWeight: FontWeight.bold),
            ),
            Text(
              'Eteint',
              style: TextStyle(
                  color: Colors.orange,
                  fontSize: 8,
                  fontFamily: 'Lufga',
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget _buildNotificationsCard() {
  return Container(
    margin: EdgeInsets.only(top: 10.0),
    padding: EdgeInsets.all(16.0),
    decoration: BoxDecoration(
      color: Color(0xFFFFE6B3),
      borderRadius: BorderRadius.circular(20.0),
    ),
    height: 100,
    width: double.infinity,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Notifications',
          style: TextStyle(
            fontSize: 8,
            fontWeight: FontWeight.bold,
            color: Color(0XFF2E4145),
            fontFamily: 'Lufga',
          ),
        ),
        // Ajoutez ici des widgets pour les notifications
      ],
    ),
  );
}