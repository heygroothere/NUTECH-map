import 'package:flutter/material.dart';
import 'package:maps/screens/google_maps.dart';
import 'package:maps/screens/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);
  static String id = 'WelcomeScreen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool bus = false;
  @override
  void initState() {
    super.initState();
    getData();
    navigate();
  }

  void getData() async {
    final prefs = await SharedPreferences.getInstance();
    print(prefs.getKeys());
    print('MEHDI');
    setState(() {
      if (prefs.getString('Bus') != null) {
        bus = true;
      } else {
        bus = false;
      }
    });
  }

  navigate() async {
    await Future.delayed(const Duration(seconds: 2));
    bus
        ? Navigator.pushNamed(context, MapsGoogle.id)
        : Navigator.pushNamed(context, HomeScreen.id);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF262626),
      body: Center(
          child: Text('Bus Tracking System by NUTECH',
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Color(0xFFDAAB2D)))),
    );
  }
}