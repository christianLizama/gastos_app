import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<StatefulWidget> createState() => _SplashScreenState();

}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    checkUserAuthentication();
  }

  void checkUserAuthentication() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print("No loggeado");
        // Usuario no loggeado, redirigir a la ruta de inicio de sesión
        Navigator.pushReplacementNamed(context, '/login');
      } else {
        print("Loggeado");
        // Usuario loggeado, redirigir a la ruta de usuario autenticado
        Navigator.pushReplacementNamed(context, '/home');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Splash Page'),
      ),
      body: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}