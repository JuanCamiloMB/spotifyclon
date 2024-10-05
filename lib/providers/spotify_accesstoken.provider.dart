import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

final accessTokenProvider = FutureProvider<String>((ref) async {
  var url = Uri.parse('https://accounts.spotify.com/api/token');

  Map<String, String> headers = {
    'Content-Type': 'application/x-www-form-urlencoded',
  };

  // Body of the request (URL-encoded)
  Map<String, String> body = {
    'grant_type': 'client_credentials',
    'client_id': '30d363dc7c16470f97c76a9f789d8d46',
    'client_secret': '2c87c93497ec416e874e12fcd8d42af3',
  };

  // Make the POST request
  var response = await http.post(
    url,
    headers: headers,
    body: body,
  );

  if (response.statusCode == 200) {
    var responseData = jsonDecode(response.body);
    return responseData['access_token'];  // Extract the access token
  } else {
    throw Exception('Failed to get access token');
  }
});