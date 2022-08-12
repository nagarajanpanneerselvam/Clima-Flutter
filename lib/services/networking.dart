import 'dart:convert';

import 'package:http/http.dart' as http;

class Network {
  static Future getNetworkResponse(Uri url) async {
    var response = await http.get(url);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return {'code': response.statusCode, 'message': response.body};
    }
  }
}
