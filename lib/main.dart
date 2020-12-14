import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './screens/places_list_screen.dart';
import './providers/great_places.dart';
import './screens/add_place_screen.dart';
import './screens/place_detail_screen.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=> GreatPlaces(),
      child: MaterialApp(
        title: "Great Places",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.red,
          accentColor: Colors.white,
        ),

        home: PlacesListScreen(),

        routes: {
          AddPlaceScreen.routeName: (context)=> AddPlaceScreen(),
          PlaceDetailScreen.routeName: (context)=> PlaceDetailScreen(),
        },
      ),
    );
  }
}












//import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';
//import './screens/places_list_screen.dart';
//import './providers/great_places.dart';
//import './screens/add_place_screen.dart';
//import './screens/place_detail_screen.dart';
//
//void main(){
//  runApp(MyApp());
//}
//
//class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return ChangeNotifierProvider(
//      create: (context)=> GreatPlaces(),
//      child: MaterialApp(
//        title: "Great Places",
//        debugShowCheckedModeBanner: false,
//        theme: ThemeData(
//          primaryColor: Colors.red,
//          accentColor: Colors.white,
//        ),
//
//        home: PlacesListScreen(),
//
//        routes: {
//          AddPlaceScreen.routeName: (context)=> AddPlaceScreen(),
//          PlaceDetailScreen.routeName: (context)=> PlaceDetailScreen(),
//        },
//      ),
//    );
//  }
//}
