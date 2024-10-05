import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spotifyclon/spotify/request_artist_data.dart';

class ArtistScreen extends ConsumerWidget {
  final String artistId = "3TVXtAsR1Inumwj472S9r4";  // Example artist ID

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Fetch the artist data using the artistDataProvider
    final artistDataAsyncValue = ref.watch(artistDataProvider(artistId));

    return Scaffold(
      appBar: AppBar(
        title: Text('Spotify Artist Info'),
      ),
      body: artistDataAsyncValue.when(
        data: (artistData) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Artist Name: ${artistData['name']}',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                Text(
                  'Followers: ${artistData['followers']['total']}',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 16),
                Text(
                  'Genres: ${artistData['genres'].join(", ")}',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          );
        },
        loading: () => Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
    );
  }
}