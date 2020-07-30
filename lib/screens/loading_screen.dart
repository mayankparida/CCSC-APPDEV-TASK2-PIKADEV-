import 'package:ccsc_appdev_task2/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ccsc_appdev_task2/screens/pikadex_screen.dart';

class LoadingScreen extends StatefulWidget {
  static String id = "loading_screen";
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  getemail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var email = prefs.getString('email');
    if (email != null) {
      Navigator.pushNamed(context, PikaDex.id);
    } else {
      Navigator.pushNamed(context, WelcomeScreen.id);
    }
  }

  @override
  void initState() {
    super.initState();
    getemail();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDualRing(
          color: Colors.redAccent,
          size: 100.0,
        ),
      ),
    );
  }
}
