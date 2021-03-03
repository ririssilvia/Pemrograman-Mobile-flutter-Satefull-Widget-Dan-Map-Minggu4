import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Result extends StatelessWidget {
  const Result({
    Key key,
    @required double kelvin,
    @required double reamur,
  }) : _kelvin = kelvin, _reamur = reamur, super(key: key);

  final double _kelvin;
  final double _reamur;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row (
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget> [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget> [
              Text('Suhu dalam Kelvin'),
              Text('$_kelvin', style: TextStyle(height: 2, fontSize:30)),
            ],
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget> [
              Text('Suhu dalam Reamur'),
              Text('$_reamur', style: TextStyle(height: 2, fontSize:30)),
            ],
          ),
        ],
      ),
    );
  }
}
