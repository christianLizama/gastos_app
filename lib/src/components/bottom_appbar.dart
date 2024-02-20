import 'package:flutter/material.dart';

class CustomBottomAppBar extends StatelessWidget {
  const CustomBottomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.transparent,
      child: SizedBox(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.home),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/home');
              },
            ),
            IconButton(
              icon: const Icon(Icons.group),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/team');
              },
            ),
            IconButton(
              icon: const Icon(Icons.person),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/profile');
              },
            ),
            IconButton(
              icon: const Icon(Icons.error),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/nothing');
              },
            ),
          ],
        ),
      ),
    );
  }
}
