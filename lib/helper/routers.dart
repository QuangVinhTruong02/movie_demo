import 'package:flutter/material.dart';
import 'package:movie_demo/ui/application/application_page.dart';
import 'package:movie_demo/ui/detail_movie/detail_movie_page.dart';
import 'package:movie_demo/ui/splash/splash_page.dart';

class Routers {
  static const String splash = "/";
  static const String application = "/application";
  static const String detailMoive = "/detailMovie";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    String? routeName = settings.name;
    var argument = settings.arguments;
    switch (routeName) {
      case splash:
        return animRoute(const SplashPage());
      case application:
        return animRoute(const ApplicationPage());
      case detailMoive:
        if (argument is int) {
          return animRoute(DetailMoviePage(movieId: argument));
        } else {
          throw Exception("argument is not int");
        }
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }

  static Route animRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = const Offset(1, 0);
        var end = Offset.zero;
        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: Curves.ease));
        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
