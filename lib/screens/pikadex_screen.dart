import 'package:ccsc_appdev_task2/screens/welcome_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ccsc_appdev_task2/components/buttons.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PikaDex extends StatefulWidget {
  static String id = 'pikadex_screen';
  @override
  _PikaDexState createState() => _PikaDexState();
}

class _PikaDexState extends State<PikaDex> {
  final _auth = FirebaseAuth.instance;
  FirebaseUser loggedInUser;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
          leading: Image.asset('images/pokemon_logo.png'),
          actions: <Widget>[
            FlatButton(
              color: Colors.redAccent,
              child: Text(
                "Log Out",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () async {
                SharedPreferences pref = await SharedPreferences.getInstance();
                pref.remove("email");
                Navigator.popAndPushNamed(context, WelcomeScreen.id);
              },
            )
          ],
          title: Text(
            'PikaDex!',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.red.shade500),
      body: ListView(
        children: <Widget>[
          PokemonCard(name: "Bulbasaur", index: 1),
          PokemonCard(name: "Charmander", index: 2),
          PokemonCard(name: "Squirtle", index: 3),
          PokemonCard(name: "Pikachu", index: 4),
        ],
      ),
    );
  }
}
