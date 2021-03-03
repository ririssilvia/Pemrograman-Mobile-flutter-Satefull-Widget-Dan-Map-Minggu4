import 'package:flutter/material.dart';

class Convert extends StatelessWidget {
final Function konvertHandler;
Convert({Key key, @required this.konvertHandler});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 420,
      height: 50,
      child: (
        // ignore: deprecated_member_use
        RaisedButton(
          onPressed: konvertHandler,
          color: Colors.blue,
          textColor: Colors.white,
          child: const Text('Konversi Suhu'),
        )
      ),
    );
  }
}