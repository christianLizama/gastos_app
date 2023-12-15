import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final List<BottomNavigationBarItem> items;
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavigationBar({super.key, 
    required this.items,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.transparent,
      child: Container(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: items
              .asMap()
              .entries
              .map(
                (entry) => IconButton(
                  icon: entry.value.icon,
                  onPressed: () {
                    onTap(entry.key);
                  },
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
