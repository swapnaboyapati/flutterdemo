import 'package:flutter/material.dart';

class BillItem extends StatelessWidget {
  final String name;
  final String desc;
  final int qty;
  final double price;
  final String imgPath;

  const BillItem({
    Key? key,
    required this.name,
    required this.desc,
    required this.qty,
    required this.price,
    required this.imgPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          // Item Image
          Image.asset(imgPath, width: 40, height: 40, fit: BoxFit.cover),
          const SizedBox(width: 10),

          // Item Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(desc, style: TextStyle(color: Colors.grey.shade600, fontSize: 12)),
              ],
            ),
          ),

          // Price
          Text("\$${(price * qty).toStringAsFixed(2)}", style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}