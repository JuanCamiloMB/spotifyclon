import 'package:flutter/material.dart';

class SongDetailsPage extends StatelessWidget {
  final String songId;

  const SongDetailsPage({required this.songId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Song Details'),
        leading: Navigator.canPop(context)
            ? IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.of(context)
                      .pop(); // Navega hacia atrás solo si es posible
                },
              )
            : null,
      ),
      body: Center(
        child: Text('Song ID: $songId'),
      ),
    );
  }
}
