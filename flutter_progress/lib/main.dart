import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_progress/progress/progress.dart';
import 'package:flutter_document_picker/flutter_document_picker.dart';
import 'package:file_picker/file_picker.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _imagePath;

  Future _pickFile() async {
    //final path = await FlutterDocumentPicker.openDocument(
    //params: FlutterDocumentPickerParams(allowedUtiTypes: ["*"])
    //    );

    final path = await FilePicker.getFilePath(type: FileType.IMAGE);
    print(path);
    setState(() {
      _imagePath = path;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        DevelopmentProgress(),
        _imagePath != null ? Image.file(File(_imagePath)) : Text("No image")
      ])),
      floatingActionButton: FloatingActionButton(
        onPressed: _pickFile,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
