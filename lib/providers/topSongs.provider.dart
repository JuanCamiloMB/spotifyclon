import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spotifyclon/models/song.model.dart';
import 'package:spotifyclon/providers/spotify_accesstoken.provider.dart';
import 'package:http/http.dart' as http;

final spotifySongsProvider = FutureProvider<List<SpotifySong>>((ref) async {
  final tokenAsyncValue = ref.watch(accessTokenProvider);

  // Check the state of the AsyncValue
  if (tokenAsyncValue is AsyncLoading) {
    await Future.delayed(Duration(milliseconds: 100));
    return [];
  } else if (tokenAsyncValue is AsyncError) {
    throw Exception("Failed to load Spotify API token");
  }

  final token = tokenAsyncValue.value;

  if (token == null) {
    throw Exception("Spotify API token not found");
  }

  final response = await fetchSpotifyData(token as String);

  if (response.statusCode == 200) {
    // Parse the JSON response
    final decodedResponse = jsonDecode(response.body);
    final List<dynamic> items = decodedResponse['tracks']['items'];

    return items.map((item) => SpotifySong.fromJson(item)).toList();
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
