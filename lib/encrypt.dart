import 'package:flutter/material.dart';
import 'package:romansa_chat/const.dart';
import 'package:romansa_chat/cryptography.dart';

class Encrypt extends StatefulWidget {
  @override
  _EncryptState createState() => _EncryptState();
}

class _EncryptState extends State<Encrypt> {
  String _cipherText = "Ini adalah ciphertext";
  TextEditingController textEditingController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enkripsi'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  labelText: "PlainText",
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
                     _cipherText = autokeyEncrypt(textEditingController.text);                
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
                     _cipherText = columnarEncrypt(textEditingController.text);                
                  });
                },
              ),
              Text("CipherText"),
              Text(_cipherText),
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