import 'package:flutter/material.dart';

class FastKeyItem extends StatelessWidget {
  final String title;
  final int index;
  final int selectedTestCase;
  final Function(int) onSelect;

  const FastKeyItem({
    super.key,
    required this.title,
    required this.index,
    required this.selectedTestCase,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    bool isSelected = selectedTestCase == index;
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: GestureDetector(
        onTap: () => onSelect(index),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: isSelected ? Colors.red.shade100 : Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Text(
            title,
            style: TextStyle(color: isSelected ? Colors.red : Colors.black),
          ),
        ),
      ),
    );
  }
}
