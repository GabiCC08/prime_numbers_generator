import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mi primera App',
      theme: ThemeData(
        // Define the default brightness and colors.
        brightness: Brightness.dark,
        primaryColor: Colors.cyan[200],
        accentColor: Colors.cyan[800],
        fontFamily: 'Poppins',
        textTheme: const TextTheme(
          headline1: TextStyle(fontSize: 50.0, fontWeight: FontWeight.w800, color: Colors.white),
          headline2: TextStyle(fontSize: 35.0),
          bodyText1: TextStyle(fontSize: 18.0, color: Colors.cyan),
        ),
      ),
      home: MyHomePage(title: 'Los Números Primos'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _prime = 2;
  void _generatePrime() {
    int cont = 0;
    int n = new Random().nextInt(1000);
    for (var i = 1; i <= n; i++) {
      if (n % i == 0) {
        cont++;
      }
    }
    if (cont == 2) {
      setState(() {
        _prime = n;
      });
    } else {
      _generatePrime();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Presiona el boton (?)\n\n',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            Text(
              'Número Primo:',
              style: Theme.of(context).textTheme.headline2,
            ),
            Text(
              '$_prime',
              style: Theme.of(context).textTheme.headline1 
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _generatePrime,
        tooltip: 'Generar Primo',
        child: Icon(Icons.device_unknown)
      ),
    );
  }
}
