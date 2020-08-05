import 'package:flutter/material.dart';
import 'package:time/time.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final DateTime Time = DateTime.now();
  var _day, _month, _year;

  final dayco = new TextEditingController();
  final monthco = new TextEditingController();
  final yearco = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'age',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF8cd9b3),
        //visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Your age',
              style: TextStyle(
                fontSize: 25,
              )),
          actions: [
            Icon(
              Icons.accessibility,
              size: 40,
            )
          ],
          backgroundColor: Color(0xFF339966),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                decoration: new InputDecoration(
                  hintText: 'Day',
                ),
                controller: dayco,
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              TextField(
                decoration: new InputDecoration(
                  hintText: 'Month',
                ),
                style: TextStyle(
                  fontSize: 25,
                ),
                controller: monthco,
              ),
              TextField(
                decoration: new InputDecoration(
                  hintText: 'Year',
                ),
                style: TextStyle(
                  fontSize: 25,
                ),
                controller: yearco,
              ),
              RaisedButton(
                onPressed: () {
                  setState(() {
                    // any number (year, month, day) compare with the normal ,Other display "Error"
                    if ((int.parse(dayco.text) > 31) &&
                        (int.parse(monthco.text) == 1 ||
                            int.parse(monthco.text) == 3 ||
                            int.parse(monthco.text) == 5 ||
                            int.parse(monthco.text) == 7 ||
                            int.parse(monthco.text) == 8 ||
                            int.parse(monthco.text) == 7 ||
                            int.parse(monthco.text) == 10 ||
                            int.parse(monthco.text) == 12))
                      dayco.text = 'Error';
                    else if ((int.parse(dayco.text) > 30) &&
                        (int.parse(monthco.text) == 4 ||
                            int.parse(monthco.text) == 6 ||
                            int.parse(monthco.text) == 9 ||
                            int.parse(monthco.text) == 11))
                      dayco.text = 'Error';
                    else if ((int.parse(yearco.text) % 4 == 0 &&
                            int.parse(dayco.text) > 29 &&
                            int.parse(monthco.text) == 2) ||
                        (int.parse(yearco.text) % 4 != 0 &&
                            int.parse(dayco.text) > 28 &&
                            int.parse(monthco.text) == 2))
                      dayco.text = 'Error';
                    else if (int.parse(monthco.text)> 12)
                      monthco.text = "Error";
                    // calculate (year, month, day) by current date              normal ==> 2020-8-1       1-7-31    1-
                    _year = Time.year - int.parse(yearco.text);
                    _month = Time.month - int.parse(monthco.text);
                    _day = Time.day - int.parse(dayco.text);
                    if (_day < 0) {
                      if (int.parse(monthco.text) == 1 ||
                          int.parse(monthco.text) == 3 ||
                          int.parse(monthco.text) == 5 ||
                          int.parse(monthco.text) == 7 ||
                          int.parse(monthco.text) == 8 ||
                          int.parse(monthco.text) == 10 ||
                          int.parse(monthco.text) == 12 ||
                          int.parse(monthco.text) == 4 ||
                          int.parse(monthco.text) == 6 ||
                          int.parse(monthco.text) == 9 ||
                          int.parse(monthco.text) == 11 ||
                          int.parse(monthco.text) == 2) {
                        _month = _month - 1;
                        _day = 31 - (-_day);
                      }
                    }
                    if (_month < 0) {
                      _year = _year - 1;
                      _month = _month + 12;
                    }
                    if (_year < 0)
                      yearco.text = 'Error';
                  });
                  if (yearco.text == 'Error') _year = 'Error';
                },
                child: const Text('Result', style: TextStyle(fontSize: 20)),
              ),
              Text('\n\n  $_year years, $_month months, and $_day days',
                  style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 20,
                      color: Color(0xFF003399))),
            ],
          ),
        ),
      ),
    );
  }
}

