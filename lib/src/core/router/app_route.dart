import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pixelecomapp/src/core/utils/constant/route_constant.dart';
import 'package:pixelecomapp/src/features/app_intro/welcome_screen.dart';
import 'package:pixelecomapp/src/features/auth/login_screen.dart';
import 'package:pixelecomapp/src/features/home/my_collection_screen.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteLiterals.welcomeScreen:
        return CupertinoPageRoute(
          builder: (_) => const WelcomeScreen(),
          settings: RouteSettings(name: settings.name),
        );

      case RouteLiterals.loginScreen:
        return CupertinoPageRoute(
          builder: (_) => const LoginScreen(),
          settings: RouteSettings(name: settings.name),
        );
      case RouteLiterals.myCollectionsScreen:
        return CupertinoPageRoute(
          builder: (_) => const MyCollectionScreen(),
          settings: RouteSettings(name: settings.name),
        );

      default:
        return CupertinoPageRoute(
          builder:
              (_) => Scaffold(
                body: Center(
                  child: Text('No route specified for ${settings.name}'),
                ),
              ),
        );
    }
  }
}
