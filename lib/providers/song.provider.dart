import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spotifyclon/providers/spotify_accesstoken.provider.dart';
import 'package:http/http.dart' as http;

final songDetailsProvider = FutureProvider.family<dynamic, String>((ref, songId) async {
    final tokenAsyncValue = ref.watch(accessTokenProvider);

  // Check the state of the AsyncValue
  if (tokenAsyncValue is AsyncLoading) {
    return; // The token is still loading
  } else if (tokenAsyncValue is AsyncError) {
    throw Exception("Failed to load Spotify API token");
  }

  final token = tokenAsyncValue.value;

  if (token == null) {
    throw Exception("Spotify API token not found");
  }

  final response = await fetchSpotifyData(token, songId);

  if (response.statusCode == 200) {
    // Parse the JSON response
    final decodedResponse = jsonDecode(response.body);
    
    // Assuming 'items' is the list of songs in the response
    // You might need to adjust this based on the actual structure of the API response
    return decodedResponse;
  } else {
    throw Exception("Failed to fetch Spotify data");
  }
});

// Function to fetch Spotify top songs
Future<http.Response> fetchSpotifyData(String token, String trackId) async {
  final url = 'https://api.spotify.com/v1/tracks/$trackId?market=ES';

  return await http.get(
    Uri.parse(url),
    headers: {
      'Authorization': 'Bearer $token',
    },
  );
}