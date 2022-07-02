import 'package:booktrip/constant.dart';
import 'package:booktrip/routes/routes_generator.dart';
import 'package:booktrip/screen/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'constant.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BookTrip',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: kBackgroundColor,
          primaryColor: Colors.blue,
          textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
          visualDensity: VisualDensity.adaptivePlatformDensity),
      initialRoute: '/login',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
