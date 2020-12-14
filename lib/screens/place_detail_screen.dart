import 'package:flutter/material.dart';
import 'package:great_places/models/place.dart';
import '../providers/great_places.dart';
import 'package:provider/provider.dart';
import '../screens/map_screen.dart';

class PlaceDetailScreen extends StatelessWidget {
  static const routeName= "/place-detail-screen";

  @override
  Widget build(BuildContext context) {
    final id= ModalRoute.of(context).settings.arguments as String;
    final placeDetail= Provider.of<GreatPlaces>(context, listen: false).findById(id);

    return Scaffold(
      appBar: AppBar(
        title: Text(placeDetail.title),
      ),

      body: Expanded(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 180,
                child: Image.file(placeDetail.image, fit: BoxFit.cover, width: double.infinity,),
              ),
              SizedBox(height: 10,),
              Text(placeDetail.location.address, textAlign: TextAlign.center,),
              SizedBox(height: 15,),
              FlatButton(
                child: Text("View on map"),
                textColor: Theme.of(context).primaryColor,
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(
                    fullscreenDialog: true,
                    builder: (context)=> MapScreen(
                      initialLocation: PlaceLocation(latitude: placeDetail.location.latitude, longitude: placeDetail.location.longitude),
                      isSelecting: false,
                    ),
                  ));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}













//import 'package:flutter/material.dart';
//import '../screens/map_screen.dart';
//import '../providers/great_places.dart';
//import 'package:provider/provider.dart';
//import '../models/place.dart';
//
//class PlaceDetailScreen extends StatelessWidget {
//  static const routeName= "/place_detail_screen";
//
//  @override
//  Widget build(BuildContext context) {
//    final id= ModalRoute.of(context).settings.arguments as String;
//    Place placeData= Provider.of<GreatPlaces>(context, listen: false).getById(id);
//
//    return Scaffold(
//      appBar: AppBar(
//        title: Text(placeData.title),
//      ),
//      body: SingleChildScrollView(
//        child: Column(
//          children: <Widget>[
//            Container(
//              height: 250,
//              width: double.infinity,
//              child: Image.file(placeData.image, fit: BoxFit.cover, width: double.infinity,),
//            ),
//            SizedBox(height: 10,),
//            Text(placeData.location.address, textAlign: TextAlign.center,),
//            SizedBox(height: 10,),
//            FlatButton(
//              child: Text("View on map"),
//              textColor: Theme.of(context).primaryColor,
//              onPressed: (){
//                Navigator.of(context).push(MaterialPageRoute(
//                  builder: (context)=> MapScreen(initialLocation: PlaceLocation(latitude: placeData.location.latitude, longitude: placeData.location.longitude),
//                    isSelecting: false,),
//                ));
//              },
//            ),
//          ],
//        ),
//      ),
//    );
//  }
//}
