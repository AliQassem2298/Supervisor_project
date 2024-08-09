import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String _selectedLanguage = 'English';
  bool _isDarkTheme = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
   //   backgroundColor: Color(0xfff8f5fa),
      backgroundColor: Color.fromRGBO(230, 228, 233, 1),



      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: Color(0xffE4C9E5),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
         // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Select Language',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color:Color(0xff36D6E7)),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Radio<String>(
                        value: 'English',
                        groupValue: _selectedLanguage,
                        onChanged: (value) {
                          setState(() {
                            _selectedLanguage = value!;
                          });
                        },
                        activeColor: Color(0xffFEB06A),
                      ),
                      Text(
                        'English',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(width: 24),
                      Radio<String>(
                        value: 'Arabic',
                        groupValue: _selectedLanguage,
                        onChanged: (value) {
                          setState(() {
                            _selectedLanguage = value!;
                          });
                        },
                        activeColor: Color(0xffFEB06A),
                      ),
                      Text(
                        'Arabic',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Divider(
              height: 5,
              thickness: 1,
              color: Color(0xff4d4c4c),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Select Theme',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xff36D6E7)),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16),
                  SwitchListTile(
                    title: Text(
                      'Dark Theme',
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                    value: _isDarkTheme,
                    onChanged: (value) {
                      setState(() {
                        _isDarkTheme = value;
                      });
                    },
                    activeColor: Color(0xffFEB06A),
                    inactiveTrackColor: Colors.grey,
                    secondary: Icon(Icons.nightlight_round, color: _isDarkTheme ?  Color(0xffFEB06A) : Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
