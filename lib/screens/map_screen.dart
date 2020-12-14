import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../models/place.dart';

class MapScreen extends StatefulWidget {
  final PlaceLocation initialLocation;
  final bool isSelecting;
  MapScreen({this.initialLocation= const PlaceLocation(latitude: 37.422, longitude: -122.084), this.isSelecting= false});

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  LatLng _pickedLocation;

  void _getLocation(LatLng location){
    setState(() {
      _pickedLocation= location;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your map"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.done),
            onPressed: _pickedLocation== null ? null : ()=> Navigator.of(context).pop(_pickedLocation),
          )
        ],
      ),

      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(widget.initialLocation.latitude, widget.initialLocation.longitude),
          zoom: 16,
        ),
        onTap: widget.isSelecting ? _getLocation : null,
        markers: (_pickedLocation== null && widget.isSelecting) ? null : {
          Marker(
            markerId: MarkerId("m1"),
            position: _pickedLocation ?? LatLng(widget.initialLocation.latitude, widget.initialLocation.longitude),
          ),
        }
      ),
    );
  }
}












//import "package:flutter/material.dart";
//import 'package:google_maps_flutter/google_maps_flutter.dart';
//import '../models/place.dart';
//
//class MapScreen extends StatefulWidget {
//  final PlaceLocation initialLocation;
//  final isSelecting;
//  MapScreen({this.initialLocation= const PlaceLocation(latitude: 37.422, longitude: -122.084), this.isSelecting= false});
//
//  @override
//  _MapScreenState createState() => _MapScreenState();
//}
//
//class _MapScreenState extends State<MapScreen> {
//
//  LatLng _pickedLocation;
//
//  void _selectedLocation(LatLng position){
//    setState(() {
//      _pickedLocation= position;
//    });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text("Your Map"),
//
//        actions: <Widget>[
//          if(widget.isSelecting)
//            IconButton(
//              icon: Icon(Icons.check),
//              onPressed: _pickedLocation== null ? null : (){
//                Navigator.of(context).pop(_pickedLocation);
//              },
//            ),
//        ],
//      ),
//      body: GoogleMap(
//        initialCameraPosition: CameraPosition(
//          target: LatLng(widget.initialLocation.latitude, widget.initialLocation.longitude),
//          zoom: 16,
//        ),
//        onTap: widget.isSelecting ? _selectedLocation : null,
//        markers: (_pickedLocation== null && widget.isSelecting) ? null : {
//          Marker(
//            markerId: MarkerId("m1"),
//            position: _pickedLocation ?? LatLng(widget.initialLocation.latitude, widget.initialLocation.longitude),
//          ),
//        },
//      ),
//    );
//  }
//}
