import 'package:brew_crew/shared/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> sugars = ['0', '1', '2', '3', '4', '5'];

  String _currentName;
  String _currentSugars;
  int _currentStrength;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Text(
            'Update your brew settings',
            style: TextStyle(
              fontSize: 14,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            decoration: textInputDecoration.copyWith(hintText: 'Name'),
            validator: (value) => value.isEmpty ? 'Please enter a name' : null,
            onChanged: (value) => setState(() => _currentName = value),
          ),
          SizedBox(
            height: 20,
          ),
          DropdownButtonFormField(
            decoration: textInputDecoration,
            value: _currentSugars ?? '0',
            items: sugars.map(
              (sugar) {
                return DropdownMenuItem(
                  value: sugar,
                  child: Text('$sugar sugar(s)'),
                );
              },
            ).toList(),
            onChanged: (value) {
              setState(() {
                _currentSugars = value;
              });
            },
          ),
          Slider(
            min: 100,
            max: 900,
            divisions: 8,
            onChanged: (value) {
              setState(() {
                _currentStrength = value.round();
              });
            },
            value: (_currentStrength ?? 100.0).toDouble(),
            activeColor: Colors.brown[_currentStrength ?? 100],
            inactiveColor: Colors.brown[_currentStrength ?? 100],
          ),
          RaisedButton(
            color: Colors.pink[400],
            child: Text(
              'Update',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onPressed: () async {
              print(_currentName);
              print(_currentStrength);
              print(_currentSugars);
            },
          )
        ],
      ),
    );
  }
}
