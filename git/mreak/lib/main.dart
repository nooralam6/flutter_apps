import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

int day = 0;

void main() {
  runApp(MreakApp());
}

class MreakApp extends StatefulWidget {
  @override
  _MreakAppState createState() => _MreakAppState();
}

class _MreakAppState extends State<MreakApp> {
  @override
  Widget build(BuildContext context) {
    getDiff();
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Mreak'),
        ),
        body: Center(child: Text('$day days')),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              saveDate();
            });
          },
          child: Icon(
            Icons.refresh,
            color: Colors.white,
          ),
          backgroundColor: Colors.red.shade900,
        ),
      ),
    );
  }

  void getDiff() {
    var now = DateTime.now();
    getDay().then((value) {
      if (value == null) {
        saveDate();
      } else {
        print(' getDiff  value $value');
        var savedDate = DateTime.parse(value);
        print(' savedDate $savedDate');

        var diff = now.difference(savedDate);
        print('diff: $diff');
        setState(() {
          day = diff.inDays;
        });
      }
    }, onError: (error) {
      print('error');
    });
  }

  Future<String> getDay() async {
    final prefs = await SharedPreferences.getInstance();
    final a = prefs.getString('mreak');
    print('getDay a $a');
    return a;
  }

  void saveDate() {
    saveNow().then((value) {
      print('saveDate');
      getDiff();
    }, onError: (error) {
      print('error');
    });
  }

  Future<void> saveNow() async {
    var now = DateTime.now().toString();
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(now, 'mreak');
    print('saveNow done $now');
  }
}
