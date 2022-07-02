import 'package:booktrip/screen/components/completePayment.dart';
import 'package:booktrip/screen/destination/detail/destination_detail.dart';
import 'package:booktrip/screen/home_screen.dart';
import 'package:booktrip/screen/landing/login.dart';
import 'package:booktrip/screen/timeline/detail/timeline_detail.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/login':
        return MaterialPageRoute(builder: (_) => Login());
      case '/':
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case '/destinationDetail':
        final args = settings.arguments as destinationDetail;
        return MaterialPageRoute(
            builder: (_) => destinationDetail(
                  address: args.address,
                  title: args.title,
                  destination: args.destination,
                  detail: args.detail,
                  harga: args.harga,
                ));
      case '/timelineDetail':
        final args = settings.arguments as timelineDetail;
        return MaterialPageRoute(
            builder: (_) => timelineDetail(
                  address: args.address,
                  title: args.title,
                  detail: args.detail,
                ));
      case '/payment':
        return MaterialPageRoute(builder: (_) => Payments());
      default:
        return _errorRoute();
    }
  }

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
