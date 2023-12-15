import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
        backgroundColor: const Color(0xFFAFB42B),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Aqui usaremos las rutas'),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.work),
                onPressed: () {
                  Navigator.pushNamed(context, 'services');
                },
              ),
              IconButton(
                icon: const Icon(Icons.group),
                onPressed: () {
                  Navigator.pushNamed(context, 'team');
                },
              ),
              IconButton(
                icon: const Icon(Icons.person),
                onPressed: () {
                  Navigator.pushNamed(context, 'profile');
                },
              ),
              IconButton(
                icon: const Icon(Icons.error),
                onPressed: () {
                  Navigator.pushNamed(context, 'nothing');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
