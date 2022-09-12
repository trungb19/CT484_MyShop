import 'dart:html';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'My Shop',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            fontFamily: 'Lato',
            // ColorScheme that can be used to configure color properties.
            // ColorScheme create a color from a MeterialColor swatch.
            colorScheme: ColorScheme.fromSwatch(
              // primarySwatch are used for key components such as FAB, buttons, active states.
              primarySwatch: Colors.purple,
              // copyWith to create a new object with the same properties as original, but with some of the values changed.
            ).copyWith(
              secondary: Colors.deepOrange,
            )),
        home: Container(
          color: Colors.green,
        ));
  }
}
