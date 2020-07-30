import 'package:flutter/material.dart';
import 'package:ccsc_appdev_task2/components/buttons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ccsc_appdev_task2/screens/pikadex_screen.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegistrationScreen extends StatefulWidget {
  static String id = 'registration_screen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  bool loadingSpinner = false;
  final _auth = FirebaseAuth.instance;
  String email;
  String password;
  storeemail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("email", email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: ModalProgressHUD(
        inAsyncCall: loadingSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Hero(
                tag: 'logo',
                child: Container(
                  height: 100.0,
                  child: Image.asset('images/pokemon_logo.png'),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              RoundEntryEmail(
                title: 'Enter your email',
                colour: Colors.red.shade500,
                onChanged: (value) {
                  email = value;
                },
              ),
              SizedBox(
                height: 8.0,
              ),
              RoundEntryPassword(
                title: 'Enter your password',
                colour: Colors.red.shade500,
                onChanged: (value) {
                  password = value;
                },
              ),
              SizedBox(
                height: 24.0,
              ),
              RoundButton(
                  title: 'Register',
                  colour: Colors.red.shade500,
                  onPressed: () async {
                    setState(() {
                      loadingSpinner = true;
                    });
                    try {
                      final new_user =
                          await _auth.createUserWithEmailAndPassword(
                              email: email, password: password);
                      if (new_user != null) {
                        storeemail();
                        Navigator.pushNamed(context, PikaDex.id);
                      }
                      setState(() {
                        loadingSpinner = false;
                      });
                    } catch (e) {
                      print(e);
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}
