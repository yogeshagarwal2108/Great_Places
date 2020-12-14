import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../models/place.dart';
import 'package:location/location.dart';
import '../helpers/location_helper.dart';
import '../screens/map_screen.dart';

class InputLocation extends StatefulWidget {
  final Function selectedLocation;
  InputLocation(this.selectedLocation);

  @override
  _InputLocationState createState() => _InputLocationState();
}

class _InputLocationState extends State<InputLocation> {
   String _imageUrl;

   Future<void> _getImageUrl(latitude, longitude) async{
     final _locationImageUrl= LocationHelper.getLocationImagePreview(latitude: latitude, longitude: longitude);
     setState(() {
       _imageUrl= _locationImageUrl;
     });
     widget.selectedLocation(latitude, longitude);
   }

   Future<void> getCurrentUserLocation() async{
     final location= await Location().getLocation();
     _getImageUrl(location.latitude, location.longitude);
   }

   Future<void> selectOnMap() async{
     LatLng selectedLocation= await Navigator.of(context).push(MaterialPageRoute(
       fullscreenDialog: true,
       builder: (context)=> MapScreen(isSelecting: true,),
     ));

     if(selectedLocation== null){
       return null;
     }
     _getImageUrl(selectedLocation.latitude, selectedLocation.longitude);
   }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 180,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
          ),
          child: _imageUrl== null
            ? Center(
              child: Text("No location chosen")
            )
            : Image.network(_imageUrl, fit: BoxFit.cover, width: double.infinity,)
        ),

        Row(
          children: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.location_on),
              label: Text("CurrentLocation"),
              textColor: Theme.of(context).primaryColor,
              onPressed: getCurrentUserLocation,
            ),
            FlatButton.icon(
              icon: Icon(Icons.map),
              label: Text("Select on map"),
              textColor: Theme.of(context).primaryColor,
              onPressed: selectOnMap,
            ),
          ],
        ),
      ],
    );
  }
}














//import 'package:flutter/material.dart';
//import 'package:location/location.dart';
//import '../helpers/location_helper.dart';
//import '../screens/map_screen.dart';
//import 'package:google_maps_flutter/google_maps_flutter.dart';
//
//class InputLocation extends StatefulWidget {
//  final Function selectedLocation;
//  InputLocation(this.selectedLocation);
//
//  @override
//  _InputLocationState createState() => _InputLocationState();
//}
//
//class _InputLocationState extends State<InputLocation> {
//  String _previewImageUrl;
//
//  Future<void> _imagePreview(double latitude, double longitude) async{
//    final locationImageUrl= LocationHelper.getLocationImageUrl(latitude: latitude, longitude: longitude);
//    setState(() {
//      _previewImageUrl= locationImageUrl;
//    });
//  }
//
//  Future<void> getCurrentUserLocation() async{
//    final location= await Location().getLocation();
//    _imagePreview(location.latitude, location.longitude);
//    widget.selectedLocation(location.latitude, location.longitude);
//  }
//
//  Future<void> selectOnMap() async{
//    final LatLng selectedLocation= await Navigator.of(context).push(MaterialPageRoute(
//       fullscreenDialog: true,
//      builder: (context)=> MapScreen(isSelecting: true,),
//    ));
//    if(selectedLocation== null){
//      return;
//    }
//    _imagePreview(selectedLocation.latitude, selectedLocation.longitude);
//    widget.selectedLocation(selectedLocation.latitude, selectedLocation.longitude);
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Column(
//      children: <Widget>[
//        Container(
//          height: 170,
//          width: double.infinity,
//          child: _previewImageUrl== null
//            ? Text("No location chosen", textAlign: TextAlign.center,)
//            : Image.network(_previewImageUrl, fit: BoxFit.cover, width: double.infinity,),
//          alignment: Alignment.center,
//          decoration: BoxDecoration(
//            border: Border.all(width: 1, color: Colors.grey),
//          ),
//        ),
//
//        Row(
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            FlatButton.icon(
//              icon: Icon(Icons.location_on),
//              label: Text("Current Location"),
//              textColor: Theme.of(context).primaryColor,
//              onPressed: getCurrentUserLocation,
//            ),
//            FlatButton.icon(
//              icon: Icon(Icons.map),
//              label: Text("Select on map"),
//              textColor: Theme.of(context).primaryColor,
//              onPressed: selectOnMap,
//            ),
//          ],
//        ),
//      ],
//    );
//  }
//}
