// Reusable History Card
import 'package:flutter/material.dart';
import 'package:tamizhi/theme/colors.dart';
import 'package:tamizhi/theme/text.dart';

class HistoryCard extends StatelessWidget {
  final IconData icon;
  final String text;
  const HistoryCard({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: AppColors.orange,
            radius: 24,
            child: Icon(icon, color: Colors.white, size: 24),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: AppTextStyles.body1,
            ),
          ),
        ],
      ),
    );
  }
}