import 'package:http/http.dart' as http;
import 'dart:convert';

class Network {
  final String url;
  final String url2;

  Network(this.url, this.url2);

  Future<dynamic> getJsonData() async{
    var murl = Uri.parse(url);
    http.Response response = await http.get(murl);
    //print(response.statusCode);
    if (response.statusCode == 200) {
      String jsonData = response.body;
      var parsingData = jsonDecode(jsonData);
      return parsingData;
    } else {
      return response.statusCode;
    }

  }

  Future<dynamic> getAirData() async{
    var murl = Uri.parse(url2);
    http.Response response = await http.get(murl);
    //print(response.statusCode);
    if (response.statusCode == 200) {
      String jsonData = response.body;
      var parsingData = jsonDecode(jsonData);
      return parsingData;
    } else {
      return response.statusCode;
    }

  }
}