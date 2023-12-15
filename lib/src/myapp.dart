import 'package:flutter/material.dart';
import 'package:gastos_app/src/pages/error_page.dart';
import 'package:gastos_app/src/pages/home_page.dart';
import 'package:gastos_app/src/pages/profile_page.dart';
import 'package:gastos_app/src/pages/services_page.dart';
import 'package:gastos_app/src/pages/team_page.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => const HomePage(),
        'profile': (BuildContext context) => const ProfilePage(),
        'services': (BuildContext context) => const ServicesPage(),
        'team': (BuildContext context) => const TeamPage(),
      },
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
            builder: (BuildContext builder) => const ErrorPage());
      },
    );
  }
}