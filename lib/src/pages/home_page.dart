import 'package:flutter/material.dart';
import 'package:gastos_app/src/components/bottom_appbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blue,
              Color.fromARGB(255, 233, 235, 250),
              Colors.purple
            ], // Colores del gradiente
          ),
        ),
        child: const Center(
          child: Text(
            '¡Bienvenido!',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomAppBar(),

    );
  }
}
