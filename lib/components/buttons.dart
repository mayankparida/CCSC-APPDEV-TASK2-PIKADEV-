import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  RoundButton({this.title, this.colour, @required this.onPressed});

  final Color colour;
  final String title;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: colour,
        borderRadius: BorderRadius.circular(16.0),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            title,
          ),
        ),
      ),
    );
  }
}

class RoundEntryEmail extends StatelessWidget {
  RoundEntryEmail({this.title, this.colour, @required this.onChanged});
  final String title;
  final Color colour;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.white),
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: title,
        hintStyle: TextStyle(color: Colors.grey),
        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: colour, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: colour, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
        ),
      ),
    );
  }
}

class RoundEntryPassword extends StatelessWidget {
  RoundEntryPassword({this.title, this.colour, @required this.onChanged});
  final String title;
  final Color colour;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: true,
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.white),
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: title,
        hintStyle: TextStyle(color: Colors.grey),
        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: colour, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: colour, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
        ),
      ),
    );
  }
}

class PokemonCard extends StatelessWidget {
  PokemonCard({this.name, this.index});
  final String name;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 30.0,
            backgroundImage: AssetImage('images/pokemon_logo.png'),
          ),
          title: Text(
            '$name',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          trailing: Text('$index'),
          onTap: () {
            return showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    backgroundColor: Colors.red.shade500,
                    title: Column(
                      children: <Widget>[
                        CircleAvatar(
                          radius: 25.0,
                          backgroundImage:
                              AssetImage("images/pokemon_logo.png"),
                        ),
                        Text("$name")
                      ],
                    ),
                    content: Text(information[name]),
                    actions: <Widget>[
                      RaisedButton(
                        color: Colors.grey.shade900,
                        child: Text("OK"),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      )
                    ],
                  );
                });
          },
        ),
      ),
    );
  }
}

var information = {
  "Bulbasaur":
      "There is a plant seed on its back right from the day this Pokémon is born. The seed slowly grows larger.",
  "Charmander":
      "It has a preference for hot things. When it rains, steam is said to spout from the tip of its tail.",
  "Squirtle":
      "When it retracts its long neck into its shell, it squirts out water with vigorous force.",
  "Pikachu":
      "Pikachu that can generate powerful electricity have cheek sacs that are extra soft and super stretchy."
};
