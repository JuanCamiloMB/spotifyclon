import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spotifyclon/views/login.view.dart';
import 'package:spotifyclon/views/profile.view.dart';
import 'package:spotifyclon/views/register.view.dart';
import 'package:spotifyclon/views/songdetails.view.dart';
import 'package:spotifyclon/views/topsongs.view.dart';
import 'package:spotifyclon/authwrapper.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

// Define a provider for the access token

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/login': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
        '/topsongs': (context) => AuthWrapper(child: TopSongs()),
        '/profile' : (context) => AuthWrapper(child: ProfilePage())
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/songdetails') {
          final args = settings.arguments as Map<String, dynamic>;
          return MaterialPageRoute(
            builder: (context) {
              return AuthWrapper(child: SongDetailsPage(songId: args['songId']));
            },
          );
        }
        return null;
      },
      initialRoute: '/login',
    );
  }
}
