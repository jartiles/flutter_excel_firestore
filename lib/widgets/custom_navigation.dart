import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_excel_firestore/providers/navigation_provider.dart';

//- Menu buttons
class MenuButton {
  final IconData icon;
  final String title;

  MenuButton({required this.title, required this.icon});
}

class CustomNavigation extends StatelessWidget {
  const CustomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final List<MenuButton> items = [
      MenuButton(title: 'Products', icon: Icons.monetization_on_outlined),
      MenuButton(
          title: 'Upload products', icon: Icons.document_scanner_outlined),
    ];

    return Container(
      width: 250,
      height: 55,
      decoration: BoxDecoration(
        color: const Color(0xFF1e242e).withOpacity(0.9),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
          items.length,
          (index) => _MenuButtons(item: items[index], index: index),
        ),
      ),
    );
  }
}

class _MenuButtons extends StatelessWidget {
  const _MenuButtons({Key? key, required this.item, required this.index})
      : super(key: key);
  final MenuButton item;
  final int index;

  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<NavigationProvider>(context);
    final activeItem = navigationProvider.getActivePage == index;
    final Color activeColor =
        activeItem ? const Color(0xFFfea943) : Colors.white;

    return GestureDetector(
      onTap: () => navigationProvider.setActivePage = index,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(item.icon, size: activeItem ? 27 : 25, color: activeColor),
          Text(
            item.title,
            style:
                TextStyle(fontSize: activeItem ? 12 : 10, color: activeColor),
          )
        ],
      ),
    );
  }
}
