import 'package:flutter/foundation.dart';
import '../model/photo.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkRequest{
  static const String url = 'https://whrzat.com:8001/api/customer/hotspotMapView';
  static List<Photo> parsecards(String responseBody){
    var list = json.decode(responseBody) as List<dynamic>;
    List <Photo> photos = list.map((model) => Photo.fromJson(model)).toList();
    return photos;
  }
  static Future <List<Photo>> fetchPhotos() async{
    final response = await http.get(Uri.parse('$url'));
    print(response);
    
    if(response.statusCode==200)
    {
      return compute(parsecards, response.body);
    }
    else
    {
      throw Exception("Can\'t get photos");
    }
  }
}