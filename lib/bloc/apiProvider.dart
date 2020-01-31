import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' show Client;

class ApiProvider {
  Client client = Client();
  final String _baseUrl = 'https://dot-test-70d73.firebaseapp.com/';
  dynamic dataError = {
    'status_code': 500,
    'message': 'Opps, Something wrong. try reload the page'
  };

  Future fetchPlaceApi() async {
    final response = await client.get("$_baseUrl/list_place.json");

    Map<String, dynamic> data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return data;
    } else {
      return dataError;
    }
  }

  Future fetchGalleryApi() async {
    final response = await client.get("$_baseUrl/list_gallery.json");

    Map<String, dynamic> data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return data;
    } else {
      return dataError;
    }
  }
}
