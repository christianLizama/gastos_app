import 'package:flutter/material.dart';
import 'package:gastos_app/src/components/bottom_appbar.dart';

class TeamPage extends StatelessWidget {
  const TeamPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Team Page'),
      ),
      bottomNavigationBar: CustomBottomAppBar(),
    );
  }
}