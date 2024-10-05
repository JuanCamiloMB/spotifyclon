import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:spotifyclon/providers/spotify_accesstoken.provider.dart';

final artistDataProvider = FutureProvider.family<Map<String, dynamic>, String>((ref, artistId) async {
  final tokenAsyncValue = await ref.watch(accessTokenProvider.future);

  var url = Uri.parse('https://api.spotify.com/v1/artists/$artistId');

  Map<String, String> headers = {
    'Authorization': 'Bearer $tokenAsyncValue',
  };

  var response = await http.get(
    url,
    headers: headers,
  );

  if (response.statusCode == 200) {
    return jsonDecode(response.body);  // Return the artist data
  } else {
    throw Exception('Failed to fetch artist data');
  }
});
