
import 'dart:convert';


import 'package:hodomojoflutterassignment/Constants/strings.dart';
import 'package:http/http.dart' as http;
var CoverUrl;
var Header;




  Future<List<dynamic>> getData() async {
    final response = await http.get(Uri.parse(sLinkApi));
    var data = json.decode(response.body);

    CoverUrl=data["data"]["coverUrl"];
    Header=data["data"]["title"];
    List<dynamic> contents = data["data"]["components"];
    return contents;
  }

