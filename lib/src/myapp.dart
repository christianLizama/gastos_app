import 'package:flutter/material.dart';
import 'package:gastos_app/src/pages/error_page.dart';
import 'package:gastos_app/src/pages/home_page.dart';
import 'package:gastos_app/src/pages/profile_page.dart';
import 'package:gastos_app/src/pages/prueba_ruta.dart';
import 'package:gastos_app/src/pages/services_page.dart';
import 'package:gastos_app/src/pages/splash_screen.dart';
import 'package:gastos_app/src/pages/team_page.dart';
import 'package:gastos_app/src/pages/about_page.dart';
import 'package:gastos_app/src/pages/login_page.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 89, 183, 255),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      routes: <String, WidgetBuilder>{
        '/home': (BuildContext context) => const HomePage(),
        '/login': (BuildContext context) => const LoginPage(),
        '/profile': (BuildContext context) => const ProfilePage(),
        '/services': (BuildContext context) => const ServicesPage(),
        '/team': (BuildContext context) => const TeamPage(),
        '/aboutPage': (BuildContext context) => const AboutPage(),
      },
      onGenerateRoute: (RouteSettings settings) {
        if (settings.name == '/nothing') {
          // Manejar la ruta '/nothing' aquí, por ejemplo, redirigir a una página de error.
          return MaterialPageRoute(
            builder: (BuildContext builder) => const ErrorPage(),
          );
        }
        // Si no coincide con ninguna ruta conocida, puedes manejarlo de la manera que prefieras.
        return MaterialPageRoute(
          builder: (BuildContext builder) => const ErrorPage(),
        );
      },
    );
  }
}
