import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spotifyclon/providers/topSongs.provider.dart';

class TopSongs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TopSongsScreen(),
    );
  }
}

class TopSongsScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final topSongsAsyncValue = ref.watch(spotifySongsProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Top 50 - Global'),
        leading: Navigator.canPop(context)
        ? IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop(); // Navega hacia atrás solo si es posible
            },
          )
        : null,
      ),
      body: topSongsAsyncValue.when(
        data: (data) {
          return ListView.builder(
            itemCount: data['tracks']['items'].length,
            itemBuilder: (BuildContext context, int index) {
              final song = data['tracks']['items'][index]['track'];
              final songName = song['name'];
              final artistName = song['artists'][0]['name'];
              final albumArt = song['album']['images'][0]['url'];
              return ListTile(
                leading: Image.network(
                  albumArt,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
                title: Text(
                  songName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Spotify-like style
                  ),
                ),
                subtitle: Text(
                  artistName,
                  style: TextStyle(color: Colors.grey),
                ),
                trailing: Icon(
                  Icons.more_vert,
                  color: Colors.white,
                ),
                tileColor: Colors.black, // Background color like Spotify
                onTap: () {
                  // Handle song tap (e.g., play song)
                },
              );
            },
          );
        },
        loading: () =>
            Center(child: CircularProgressIndicator()), // Loading state
        error: (error, stack) =>
            Center(child: Text('Error: $error')), // Error state
      ),
    );
  }
}
