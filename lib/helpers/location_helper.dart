import 'package:http/http.dart' as http;
import 'dart:convert';

const GLOBAL_API_KEY= "AIzaSyAJqBRSW9NoY-hVWiNYhfb9TXRRK2gKl0A";

class LocationHelper{

  static String getLocationImagePreview({double latitude, double longitude}){
    return "https://maps.googleapis.com/maps/api/staticmap?center=&$latitude,$longitude&zoom=16&size=600x300&maptype=roadmap&markers=color:red%7Clabel:C%7C$latitude,$longitude&key=$GLOBAL_API_KEY";
  }

  static Future<String> getAddress(double latitude, double longitude) async{
    final url= "https://maps.googleapis.com/maps/api/geocode/json?latlng=$latitude,$longitude&key=$GLOBAL_API_KEY";
    final response= await http.get(url);
    return json.decode(response.body)["results"][0]["formatted_address"];
  }
}









//import 'package:http/http.dart' as http;
//import 'dart:convert';
//
//const GLOBAL_MAP_API_KEY= "AIzaSyAJqBRSW9NoY-hVWiNYhfb9TXRRK2gKl0A";
//
//class LocationHelper{
//  static String getLocationImageUrl({double latitude, double longitude}){
//    return "https://maps.googleapis.com/maps/api/staticmap?center=&$latitude,$longitude&zoom=16&size=600x300&maptype=roadmap&markers=color:red%7Clabel:C%7C$latitude,$longitude&key=$GLOBAL_MAP_API_KEY";
//  }
//
//  static Future<String> getAddress(double lat, double lng) async{
//    final url= "https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lng&key=$GLOBAL_MAP_API_KEY";
//    var response= await http.get(url);
//    print(json.decode(response.body));
//    return json.decode(response.body)["results"][0]["formatted_address"];
//  }
//}