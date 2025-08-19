import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tamizhi/components/margin.dart';
import 'package:tamizhi/theme/colors.dart';
import 'package:tamizhi/theme/text.dart';

class MetaphorCard extends StatelessWidget {
  final double width;
  final IconData icon;
  final String title;
  final String buttonText;
  final VoidCallback onTap;

  const MetaphorCard({
    super.key,
    required this.width,
    required this.icon,
    required this.title,
    required this.buttonText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 165,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppColors.orange.shade100,
          width: 1.5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: AppColors.black,
            child: Icon(icon, size: 24, color: AppColors.white),
          ),
          Margin(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: AppTextStyles.headline6.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
              const Icon(
                Iconsax.arrow_right_3,
                color: AppColors.black,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
