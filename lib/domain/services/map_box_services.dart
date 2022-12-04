import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;
import 'package:restaurant/domain/models/map_box/driving_response.dart';

class MapBoxServices {

  final _url = 'https://api.mapbox.com/directions/v5';
  final _apikey = 'pk.eyJ1IjoiaG9hbmd0cnVvbmcyMTkiLCJhIjoiY2xiNHM1bmljMGEwNDQybzV6ZnJzNjlhMiJ9.9gVIO4b-YUSRcb-PPuh0lQ';


  Future<DrivingResponse> getCoordsOriginAndDestinationDelivery(LatLng origin, LatLng destination) async {

    final coordString = '${origin.longitude},${origin.latitude};${destination.longitude},${destination.latitude}';

    final url = '$_url/mapbox/driving/$coordString';

    final resp = await http.get(Uri.parse('$url?alternatives=true&geometries=polyline6&steps=false&access_token=$_apikey&language=es'));

    return DrivingResponse.fromJson(jsonDecode(resp.body));
  }

}

final mapBoxServices = MapBoxServices();