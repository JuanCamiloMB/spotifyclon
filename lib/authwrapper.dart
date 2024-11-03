import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spotifyclon/views/login.view.dart';
import 'package:spotifyclon/views/register.view.dart';
import 'package:spotifyclon/providers/auth.provider.dart';

class AuthWrapper extends ConsumerWidget {
  final Widget child;

  const AuthWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);

    return authState.when(
        data: (user) {
          if (user == null) {
            final currentRoute = ModalRoute.of(context)?.settings.name;

          if (currentRoute == '/register') {
            return RegisterPage();
          } else {
            return LoginPage();
          }
          } else {
            return child;
          }
        },
        loading: () => const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            ),
        error: (error, _) => Scaffold(
              body: Center(
                child: Text('Error: $error'),
              ),
            ));
  }
}
