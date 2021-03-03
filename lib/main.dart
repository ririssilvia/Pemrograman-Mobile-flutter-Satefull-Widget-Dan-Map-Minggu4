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

  //mengeset nilai pada dropdown
  String _newValue = "Kelvin";
  double _result = 0;

  //Fungsi perhitungan suhu perlu untuk diubah sehingga hanya memproses konversi sesuai
  //dengan pilihan pengguna.
  void _konversiSuhu() {
    setState(() {
      _inputUser = double.parse(etInput.text);
      if (_newValue == "Kelvin")
        _result = _inputUser + 273;
      else
        _result = (4 / 5) * _inputUser;
    });
  }


  //buat list
  var listItem = {"Kelvin", "Reamur"};

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
                DropdownButton<String>(
                  items: listItem.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  // isi value dengan variabel _newValue.
                  value: _newValue,
                  onChanged: (String changeValue) {
                    setState(() {
                      _newValue = changeValue;
                    });
                  },
                ),
                Result(result: _result,),
                Convert(konvertHandler: _konversiSuhu),
              ],
            ),
          ),
        ));
  }
}
