import 'package:flutter/material.dart';
import 'Input.dart';
import 'Result.dart';
import 'Convert.dart';
import 'RiwayatKonversi.dart';
import 'Dropdown.dart';

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
  String _newValue = "Reamur";
  double _result = 0;

  //buat list
  var listItem = {"Kelvin", "Reamur", "Farenheit"};

  //variable bertipe List<String> (praktikum 2)
  // ignore: deprecated_member_use
  List<String> listViewItem = List<String>();

  //Fungsi perhitungan suhu perlu untuk diubah sehingga hanya memproses konversi sesuai
  //dengan pilihan pengguna.
  void _konversiSuhu() {
    setState(() {
      _inputUser = double.parse(etInput.text);
      if (_newValue == "Kelvin")
        _result = _inputUser + 273;
      else if (_newValue == "Reamur")
        _result = (4 / 5) * _inputUser;
      else
        _result = (_inputUser * (9 / 5)) + 32;
      //untuk menampilkan hasil riwayat
      listViewItem.add("$_newValue : $_result");
    });
  }

  void dropdownOnChanged(String changeValue) {
    setState(() {
      _newValue = changeValue;
      _konversiSuhu();
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
                DropdownKonversi(
                    listItem: listItem,
                    newValue: _newValue,
                    dropdownOnChanged: dropdownOnChanged),
                Result(
                  result: _result,
                ),
                Convert(konvertHandler: _konversiSuhu),
                //Riwayat Konversi
                Container(
                  margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: Text(
                    "Riwayat Konversi",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ),
                Expanded(child: RiwayatKonversi(listViewItem: listViewItem)),
              ],
            ),
          ),
        ));
  }
}
