import 'package:flutter/material.dart';
import 'textFormField.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      title: "Text Field",
      home: TextFormFieldPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
