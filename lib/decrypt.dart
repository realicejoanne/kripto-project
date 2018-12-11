import 'package:flutter/material.dart';
import 'package:romansa_chat/const.dart';
import 'package:romansa_chat/cryptography.dart';

class Decrypt extends StatefulWidget {
  @override
  _DecryptState createState() => _DecryptState();
}

class _DecryptState extends State<Decrypt> {
  String _plainText = "Ini adalah plainText";
  TextEditingController textEditingController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dekripsi'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  labelText: "CipherText",
                ),
                controller: textEditingController,
              ),
              MaterialButton(
                color: themeColor,
                child: Text(
                  "Autokey",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: (){
                  setState(() {
                     _plainText = autokeyDecrypt(textEditingController.text);                
                  });
                },
              ),
              MaterialButton(
                color: themeColor,
                child: Text(
                  "Columnar",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: (){
                  setState(() {
                     _plainText = columnarDecrypt(textEditingController.text);                
                  });
                },
              ),
              Text("PlainText"),
              Text(_plainText),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    textEditingController.dispose();
    super.dispose();
  }
}