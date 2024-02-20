import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gastos_app/src/components/bottom_appbar.dart';
import 'package:gastos_app/src/services/auth.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 50,
              backgroundImage:
                  user?.photoURL != null && user!.photoURL!.isNotEmpty
                      ? NetworkImage(user.photoURL!)
                      : const AssetImage(
                          'assets/images/default_avatar.png', // Reemplaza 'default_avatar.png' con tu imagen predeterminada
                        ) as ImageProvider<Object>?,
            ),
            const SizedBox(height: 20),
            Text(
              'Hola, ${user?.displayName ?? 'Usuario'}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'Correo electrónico: ${user?.email ?? ''}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                AuthServices().signOut();
                Navigator.pushNamed(context, '/login');
              },
              child: const Text('Cerrar sesión'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomAppBar(),
    );
  }
}
