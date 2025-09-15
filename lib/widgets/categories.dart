import 'package:flutter/material.dart';

class CategoryChip extends StatelessWidget {
  final String label;
  final IconData? icon;
  const CategoryChip({Key? key, required this.label, this.icon})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      margin: const EdgeInsets.only(right: 12),
      child: Chip(
        avatar:
            icon != null
                ? Icon(
                  icon,
                  size: 20,
                  color: isDark ? Colors.white : Colors.black87,
                )
                : null,
        label: Text(
          label,
          style: TextStyle(
            color: isDark ? Colors.white : Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: 15,
            fontFamily: 'Montserrat',
            letterSpacing: 0.2,
          ),
        ),
        backgroundColor:
            isDark ? const Color(0xFF23262B) : const Color(0xFFF2F2F2),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 4),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide.none,
        ),
        elevation: 0,
      ),
    );
  }
}
