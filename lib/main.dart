import 'package:binary_mobile_app/screens/trade_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color.fromARGB(255, 240, 240, 240),
        backgroundColor: Color.fromARGB(255, 42, 49, 80),
        accentColor: Color.fromRGBO(42, 49, 80, 30),
        scaffoldBackgroundColor: Color.fromARGB(255, 240, 240, 240)
      ),
      home: TradeScreen(),
    );
  }

}