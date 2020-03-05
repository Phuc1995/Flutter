import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart' as image_libary;
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(new MaterialApp(
    title: "Camera",
    home: LandingScreen(),
  ));
}

class LandingScreen extends StatefulWidget {


  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {

  File imageFile;

  _openGallary(BuildContext context) async {

    var picture = await image_libary.ImagePicker.pickImage(source: image_libary.ImageSource.gallery);

    this.setState((){
      imageFile = picture;
    });
    Navigator.of(context).pop();
  }


  static Future<String> createFolderInAppDocDir(String folderName) async {

    //Get this App Document Directory
    final Directory _appDocDir = await getApplicationDocumentsDirectory();
    //App Document Directory + folder name
    final Directory _appDocDirFolder =  Directory('${_appDocDir.path}/$folderName');
    print(_appDocDirFolder);
    if(await _appDocDirFolder.exists()){ //if folder already exists return path
      print("exist");
      return _appDocDirFolder.path;
    }else{//if folder not exists create folder and then return its path
      final Directory _appDocDirNewFolder=await _appDocDirFolder.create(recursive: true);
      print("Not exist");
      return _appDocDirNewFolder.path;
    }
  }



  _openCamera(BuildContext context) async {

    var picture = await image_libary.ImagePicker.pickImage(source: image_libary.ImageSource.camera);
    // getting a directory path for saving
    this.setState((){
      imageFile = picture;
    });
    Navigator.of(context).pop();
  }

  Widget _decideImageVIew(){
    if(imageFile == null){
      return Text("Image is null");
    }else {
      return Image.file(imageFile, height: 400, width: 400,);
    }
  }

  Future<void> _showChoiceDialog(BuildContext context){
    return showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(
        title: Text("Make a choice", ),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  child: Text("Gallary"),
                  onTap: (){
                    _openGallary(context);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  child: Text("Camera"),
                  onTap: (){
                    _openCamera(context);
                  },
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Main Screen"),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              _decideImageVIew(),
              RaisedButton(
                onPressed: () {
                  _showChoiceDialog(context);
                },
                child: Text("Select Image"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
