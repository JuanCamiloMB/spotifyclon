import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spotifyclon/providers/spotify_accesstoken.provider.dart';
import 'package:http/http.dart' as http;

final spotifySongsProvider = FutureProvider<dynamic>((ref) async {
  final token = ref.watch(accessTokenProvider);

  if (token == null) {
    throw Exception("Spotify API token not found");
  }

  final response = await fetchSpotifyData(token as String);

  if (response.statusCode == 200) {
    print(response.body);
    // Parse the JSON response
    final decodedResponse = jsonDecode(response.body);
    
    // Assuming 'items' is the list of songs in the response
    // You might need to adjust this based on the actual structure of the API response
    return decodedResponse['items'];
  } else {
    throw Exception("Failed to fetch Spotify data");
  }
});

// Function to fetch Spotify top songs
Future<http.Response> fetchSpotifyData(String token) async {
  final url = 'https://api.spotify.com/v1/playlists/37i9dQZEVXbMDoHDwVN2tF';

  return await http.get(
    Uri.parse(url),
    headers: {
      'Authorization': 'Bearer $token',
    },
  );
}