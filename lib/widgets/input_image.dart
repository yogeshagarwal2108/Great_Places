import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as pathProvider;

class InputImage extends StatefulWidget {
  final Function selectedImage;
  InputImage(this.selectedImage);

  @override
  _InputImageState createState() => _InputImageState();
}

class _InputImageState extends State<InputImage> {
  File _image;

  Future<void> getImage() async{
    final picker= ImagePicker();
    final _storedImage= await picker.getImage(source: ImageSource.camera, maxWidth: 600);
    if(_storedImage== null){
      return;
    }

    setState(() {
      _image= File(_storedImage.path);
    });

    final dirName= await pathProvider.getApplicationDocumentsDirectory();
    final fileName= path.basename(_image.path);
    final savedImage= await _image.copy("${dirName.path}/$fileName");

    widget.selectedImage(savedImage);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          height: 100,
          width: 180,
          decoration: BoxDecoration(
//            borderRadius: BorderRadius.circular(15),
            border: Border.all(width: 1, color: Colors.grey),
          ),
          alignment: Alignment.center,
          child: _image== null ? Center(child: Text("No image taken"),) : Image.file(_image, fit: BoxFit.cover, width: double.infinity,)
        ),

        Expanded(
          child: FlatButton.icon(
            icon: Icon(Icons.camera),
            label: Text("Take image", textAlign: TextAlign.center,),
            textColor: Theme.of(context).primaryColor,
            onPressed: getImage,
          ),
        ),
      ],
    );
  }
}














//import 'package:flutter/material.dart';
//import 'dart:io';
//import 'package:image_picker/image_picker.dart';
//import 'package:path/path.dart' as path;
//import 'package:path_provider/path_provider.dart' as pathProvider;
//
//class InputImage extends StatefulWidget {
//  final Function selectedImage;
//  InputImage(this.selectedImage);
//
//  @override
//  _InputImageState createState() => _InputImageState();
//}
//
//class _InputImageState extends State<InputImage> {
//  File _storedImage;
//
//  Future<void> getImage() async{
//    final picker= ImagePicker();
//    final _image= await picker.getImage(source: ImageSource.camera, maxWidth: 600);
//    if(_image== null){
//      return;
//    }
//    setState(() {
//      _storedImage= File(_image.path);
//    });
//
//    final appDir= await pathProvider.getApplicationDocumentsDirectory();
//    final fileName= path.basename(_storedImage.path);
//
//    final savedImage= await _storedImage.copy("${appDir.path}/$fileName");
//    widget.selectedImage(savedImage);
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Row(
//      children: <Widget>[
//        Container(
//          height: 100,
//          width: 160,
//          child: _storedImage!= null
//            ? Image.file(_storedImage, fit: BoxFit.cover, width: double.infinity,)
//            : Center(child: Text("No Image Taken", textAlign: TextAlign.center,)),
//          decoration: BoxDecoration(
//            border: Border.all(width: 1, color: Colors.grey),
//          ),
//        ),
//
//        SizedBox(width: 10,),
//
//        Expanded(
//          child: FlatButton.icon(
//            icon: Icon(Icons.camera),
//            label: Text("Take image"),
//            textColor: Theme.of(context).primaryColor,
////            splashColor: Colors.redAccent,
//            onPressed: getImage,
//          ),
//        ),
//      ],
//    );
//  }
//}
