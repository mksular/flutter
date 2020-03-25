import 'package:flutter/material.dart';
import 'package:stateful/alert.dart';

class HomePage extends StatefulWidget {

  final String _title;
  HomePage(this._title);

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
   int sayac = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget._title),
      ),
      body: Container(
        
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                setState(() {
                 sayac++;
                });
              },
              padding: EdgeInsets.all(10),
              color: Colors.green,
              child: Text("+", style: TextStyle(fontSize: 36)),
            ),
            Padding(
              padding: EdgeInsets.all(10),
            ),
            Text(
              sayac.toString(),
              style: TextStyle(fontSize: 36, color: sayac>=0?Colors.green:Colors.red),
            ),
            Padding(
              padding: EdgeInsets.all(10),

            ),
            RaisedButton(
              onPressed: () {
                setState(() {
                  sayac--;
                });
              },
              padding: EdgeInsets.all(10),
              color: Colors.red,
              child: Text("-", style: TextStyle(fontSize: 36)),
            )
          ],
        ),
      ),
    );
  }
}
