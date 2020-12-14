import 'package:flutter/material.dart';
import '../models/place.dart';
import 'dart:io';
import '../helpers/sql_helper.dart';
import '../helpers/location_helper.dart';

class GreatPlaces with ChangeNotifier{
  List<Place> _items= [];

  List<Place> get items{
    return [..._items];
  }

  Place findById(String id){
    return _items.firstWhere((place)=> place.id== id);
  }

  Future<void> addPlace(String title, File pickedImage, PlaceLocation pickedLocation) async{
    final address= await LocationHelper.getAddress(pickedLocation.latitude, pickedLocation.longitude);
    final updatedLocation= PlaceLocation(latitude: pickedLocation.latitude, longitude: pickedLocation.longitude, address: address);
    final newPlace= Place(
      id: DateTime.now().toString(),
      title: title,
      image: pickedImage,
      location: updatedLocation,
    );
    _items.add(newPlace);
    notifyListeners();
    await DbHelper.insert("user_places", {
      "id": newPlace.id,
      "title": newPlace.title,
      "image": newPlace.image.path,
      "locLat": newPlace.location.latitude,
      "locLng": newPlace.location.longitude,
      "address": newPlace.location.address,
    });
  }

  Future<void> fetchAndSetData() async{
    final data= await DbHelper.getData("user_places");
    _items= data.map((item)=> Place(
      id: item["id"],
      title: item["title"],
      image: File(item["image"]),
      location: PlaceLocation(latitude: item["locLat"], longitude: item["locLng"], address: item["address"]),
    )).toList();

    notifyListeners();
  }
}












//import 'package:flutter/material.dart';
//import '../models/place.dart';
//import 'dart:io';
//import '../helpers/sql_helper.dart';
//import '../helpers/location_helper.dart';
//
//class GreatPlaces with ChangeNotifier{
//  List<Place> _items= [];
//
//  List<Place> get items{
//    return [..._items];
//  }
//
//  Place getById(String id){
//    return _items.firstWhere((place)=> place.id== id);
//  }
//
//  Future<void> addPlace(String title, File pickedImage, PlaceLocation location) async{
//    String address= await LocationHelper.getAddress(location.latitude, location.longitude);
//    final updatedLocation= PlaceLocation(latitude: location.latitude, longitude: location.longitude, address: address);
//    final newPlace= Place(id: DateTime.now().toString(), title: title, image: pickedImage, location: updatedLocation);
//    _items.add(newPlace);
//    notifyListeners();
//
//    await DbHelper.insert("user_places", {
//      "id": newPlace.id,
//      "title": newPlace.title,
//      "image": newPlace.image.path,
//      "locLat": newPlace.location.latitude,
//      "locLng": newPlace.location.longitude,
//      "address": newPlace.location.address,
//    });
//  }
//
//  Future<void> fetchAndSetData() async{
//    final data= await DbHelper.getData("user_places");
//    _items= data.map((item)=> Place(
//      id: item["id"],
//      title: item["title"],
//      image: File(item["image"]),
//      location: PlaceLocation(latitude: item["locLat"], longitude: item["lonLng"], address: item["addresst"]),
//    )).toList();
//
//    notifyListeners();
//  }
//}