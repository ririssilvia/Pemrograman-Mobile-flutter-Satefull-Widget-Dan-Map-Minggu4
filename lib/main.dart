import 'package:flutter/material.dart';
import 'Input.dart';
import 'Result.dart';
import 'Convert.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //controller
  TextEditingController etInput = new TextEditingController();

  //variabel berubah
  double _inputUser = 0;
  double _kelvin = 0;
  double _reamur = 0;

  //fungsi
  void _konversiSuhu() {
    setState(() {
      _inputUser = double.parse(etInput.text);
      _kelvin = _inputUser + 273;
      _reamur = _inputUser * (4 / 5);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text("Konverter Suhu"),
          ),
          body: Container(
            margin: EdgeInsets.all(8),
            child: Column(
              children: [
                Input(etInput: etInput),
                //memperluas anak row
                DropdownButton(
                  items: [
                    DropdownMenuItem(
                        value: "Kelvin",
                        child: Container(child: Text("Kelvin"))),
                    DropdownMenuItem(
                        value: "Reamur",
                        child: Container(child: Text("Reamur"))),
                  ],
                  value: null,
                  onChanged: (String changeValue) {},
                ),
                Result(kelvin: _kelvin, reamur: _reamur),
                Convert(konvertHandler: _konversiSuhu),
              ],
            ),
          ),
        ));
  }
}
