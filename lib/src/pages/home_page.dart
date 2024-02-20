import 'package:flutter/material.dart';
import 'package:gastos_app/src/pages/about_page.dart';
import 'package:gastos_app/src/components/login_component.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomCenter,
            colors: [Colors.blue,Color.fromARGB(255, 233, 235, 250), Colors.purple], // Colores del gradiente
          ),
        ),
        child: Center(
          child: LoginComponent(
            onSubmit: (String email, String password) {
              // Lógica de inicio de sesión
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AboutPage()),
              );
            },
          ),
        ),
      ),
    );
  }
}
