import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimePicker extends StatefulWidget {
  DateTimePicker({Key key}) : super(key: key);

  @override
  _DateTimePickerState createState() => _DateTimePickerState();
}

class _DateTimePickerState extends State<DateTimePicker> {
  DateTime _startDate = DateTime(1900, 1, 1);
  DateTime _endDate = DateTime(2100, 1, 1);
  String _date = DateFormat('yyyy-MM-dd').format(DateTime.now());
  String _time = DateFormat('HH:mm').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Date Time Picker'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
                margin: EdgeInsets.all(10),
                child: RaisedButton(
                  padding: EdgeInsets.all(10),
                  color: Colors.transparent,
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(5.0),
                      side: BorderSide(color: Colors.teal)),
                  onPressed: () {
                    showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: _startDate,
                            lastDate: _endDate)
                        .then((x) {
                      setState(() {
                        _date = DateFormat('yyyy-MM-dd').format(x).toString();
                      });
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Icon(Icons.date_range),
                      Container(
                        width: 10,
                      ),
                      Text(_date.toString()),
                      Container(
                        width: 10,
                      ),
                      Icon(Icons.settings),
                    ],
                  ),
                )),
            Container(
                margin: EdgeInsets.all(10),
                child: RaisedButton(
                  padding: EdgeInsets.all(10),
                  color: Colors.transparent,
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(5.0),
                      side: BorderSide(color: Colors.teal)),
                  onPressed: () {
                    showTimePicker(
                            context: context, initialTime: TimeOfDay.now())
                        .then((x) {
                      setState(() {
                        _time = "${x.hour}:${x.minute}";
                      });
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Icon(Icons.access_time),
                      Container(
                        width: 10,
                      ),
                      Text(_time.toString()),
                      Container(
                        width: 10,
                      ),
                      Icon(Icons.settings),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
