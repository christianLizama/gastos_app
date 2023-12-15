import 'package:flutter/material.dart';
import 'package:gastos_app/src/pages/about_page.dart';
import 'package:gastos_app/src/components/login_component.dart'; // Importa el componente de inicio de sesión

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: const Color(0xFFFF9800),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Aquí agregamos el formulario de inicio de sesión
            LoginComponent(
              onSubmit: (email, password) {
                final route = MaterialPageRoute(
                  builder: (context) {
                    return const AboutPage();
                  },
                );
                Navigator.push(context, route);
              },
            ),
          ],
        ),
      ),
    );
  }
}
