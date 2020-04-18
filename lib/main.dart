import 'package:flutter/material.dart';
import 'price_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          primaryColor: Colors.black,
          scaffoldBackgroundColor: Colors.black,
          accentColor: Colors.purple,
          cardTheme: CardTheme(color: Colors.deepPurple[800])
      ),
      home: PriceScreen(),
    );
  }
}
