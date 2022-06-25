import 'package:flutter/material.dart';

class RouteGenerator {
  // static Route<dynamic> generateRoute(RouteSettings settings) {
  //   switch (settings.name) {
  //     case '/':
  //       return MaterialPageRoute(builder: (_) => HomePage());
  //     case '/todosDetail':
  //       final args = settings.arguments as todosDetail;
  //       return MaterialPageRoute(
  //           builder: (_) => todosDetail(
  //                 userId: args.userId,
  //                 id: args.id,
  //                 title: args.title,
  //                 completed: args.completed,
  //               ));
  //     default:
  //       return _errorRoute();
  //   }
  // }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('ERROR'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
