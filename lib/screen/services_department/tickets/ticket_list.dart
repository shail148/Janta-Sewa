import 'package:flutter/material.dart';
import 'package:janta_sewa/widget/colors.dart';
import 'package:janta_sewa/widget/text_widget.dart';

class PassengerList extends StatelessWidget {
  final List<Map<String, String>> passengers;
  final void Function(int index) onDelete;
  final void Function()? onAdd;

  const PassengerList({
    Key? key,
    required this.passengers,
    required this.onDelete,
    this.onAdd,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...passengers.asMap().entries.map((entry) {
          final index = entry.key;
          final p = entry.value;
          return Card(
            color: const Color(0xFFF5F6FA),
            margin: const EdgeInsets.symmetric(vertical: 4),
            child: ListTile(
              title: Text(
                "${p['name'] ?? ''}, ${p['gender'] ?? ''}, ${p['pnr'] ?? ''}",
                style: const TextStyle(fontSize: 14),
              ),
              trailing: IconButton(
                icon: const Icon(Icons.delete, color: Colors.blue),
                onPressed: () => onDelete(index),
              ),
            ),
          );
        }),
        if (onAdd != null)
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                onPressed: onAdd,
                backgroundColor: AppColors.btnBgColor,
                child: const Icon(Icons.add, color: Colors.white, size: 30),
                mini: true,
              ),
            ],
          ),
      ],
    );
  }
}
}
