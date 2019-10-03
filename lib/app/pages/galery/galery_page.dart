import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class GaleryPage extends StatefulWidget {
  @override
  _GaleryPageState createState() => _GaleryPageState();
}

class _GaleryPageState extends State<GaleryPage> {
  List<File> _photos = [];

  var systemTempDir = Directory.systemTemp;
  String directory = "/storage/emulated/0/DCIM/Camera/";
  List file = new List();

  void _listofFiles() async {
    directory = (await getApplicationDocumentsDirectory()).path;
    setState(() {
      file = Directory("$directory").listSync();
      for (var i in file) {
        print("Arquivos $i");
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _listofFiles();
  }

  @override
  Widget build(BuildContext context) {
    AppBar appBar = AppBar(
      title: Text("Galeria"),
      actions: <Widget>[
        GestureDetector(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Text(
              "Avançar",
              style: TextStyle(
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ),
        )
      ],
    );

    var altura = (MediaQuery.of(context).size.height -
            appBar.preferredSize.height -
            30) /
        2;
    var largura = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: appBar,
      body: Column(
        children: <Widget>[
          Container(
            color: Colors.pink,
            width: largura,
            height: altura,
          ),
          Container(
            color: Colors.blue,
            width: largura,
            height: altura,
          ),
        ],
      ),
    );
  }
}
