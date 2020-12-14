import 'package:flutter/material.dart';
import '../widgets/input_image.dart';
import 'dart:io';
import '../providers/great_places.dart';
import 'package:provider/provider.dart';
import '../widgets/input_location.dart';
import '../models/place.dart';

class AddPlaceScreen extends StatefulWidget {
  static const routeName= "/add_place_screen";

  @override
  _AddPlaceScreenState createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  Map<String, dynamic> placeData= {
    "title": "",
  };
  GlobalKey<FormState> _formKey= GlobalKey<FormState>();

  File _selectedImage;
  PlaceLocation _selectedLocation;

  selectedImage(File pickedImage){
    _selectedImage= pickedImage;
  }

  selectedLocation(PlaceLocation pickedLocation){
    _selectedLocation= pickedLocation;
  }

  _savePlace() async{
    if(_formKey.currentState.validate() && _selectedImage!= null){
      _formKey.currentState.save();
      print(_selectedImage);
      await Provider.of<GreatPlaces>(context, listen: false).addPlace(placeData["title"], _selectedImage, _selectedLocation);
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add place"),
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "Title",
                        ),
                        onSaved: (value){
                          placeData["title"]= value;
                        },
                        keyboardType: TextInputType.text,
                        validator: (value){
                          if(value.isEmpty){
                            return "Please provide title";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10,),
                      InputImage(selectedImage),
                      SizedBox(height: 10,),
                      InputLocation(selectedLocation),
                    ],
                  ),
                ),
              ),
            ),
          ),

          RaisedButton.icon(
            icon: Icon(Icons.add),
            label: Text("Add place"),
            onPressed: _savePlace,
            textColor: Colors.white,
            color: Colors.brown,
//            elevation: 0,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
        ],
      ),
    );
  }
}












//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//import 'package:great_places/models/place.dart';
//import 'package:provider/provider.dart';
//import '../widgets/input_image.dart';
//import 'dart:io';
//import '../providers/great_places.dart';
//import '../widgets/input_location.dart';
//
//class AddPlaceScreen extends StatefulWidget {
//  static const routeName= "/add-place-screen";
//
//  @override
//  _AddPlaceScreenState createState() => _AddPlaceScreenState();
//}
//
//class _AddPlaceScreenState extends State<AddPlaceScreen> {
//  Map<String, dynamic> _placeData= {
//    "title": "",
//  };
//
//  GlobalKey<FormState> _formKey= GlobalKey<FormState>();
//
//  File _selectedImage;
//  PlaceLocation _selectedLocation;
//
//  void selectedImage(File pickedImage){
//    _selectedImage= pickedImage;
//  }
//
//  void selectedLocation(PlaceLocation pickedLocation){
//    _selectedLocation= pickedLocation;
//  }
//
//  _savePlace() async{
//    if(_formKey.currentState.validate() && _selectedImage!= null && _selectedLocation!= null){
//      _formKey.currentState.save();
//      await Provider.of<GreatPlaces>(context, listen: false).addPlace(_placeData["title"], _selectedImage, _selectedLocation);
//      Navigator.of(context).pop();
//    }
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text("Add a new place"),
//      ),
//      body: Column(
//        crossAxisAlignment: CrossAxisAlignment.stretch,
////        mainAxisAlignment: MainAxisAlignment.spaceBetween,
//        children: <Widget>[
//          Expanded(
//            child: SingleChildScrollView(
//              child: Padding(
//                padding: EdgeInsets.all(14),
//                child: Form(
//                  key: _formKey,
//                  child: Column(
//                    children: <Widget>[
//                      TextFormField(
//                        decoration: InputDecoration(
//                          labelText: "Title",
//                        ),
//                        validator: (value){
//                          if(value.isEmpty){
//                            return "Please provide title";
//                          }
//                          return null;
//                        },
//                        textInputAction: TextInputAction.next,
//                        keyboardType: TextInputType.name,
//                        onSaved: (value){
//                          _placeData["title"]= value;
//                        },
//                      ),
//
//                      SizedBox(height: 10,),
//                      InputImage(selectedImage),
//                      SizedBox(height: 10,),
//                      InputLocation(selectedLocation),
//
//                    ],
//                  ),
//                ),
//              ),
//            ),
//          ),
//
//          RaisedButton.icon(
//            icon: Icon(Icons.add),
//            label: Text("Add Place"),
//            onPressed: _savePlace,
////            elevation: 0,
//            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
//            color: Colors.redAccent,
//          ),
//        ],
//      ),
//    );
//  }
//}
