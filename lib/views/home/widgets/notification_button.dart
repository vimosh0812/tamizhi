import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../theme/colors.dart';

IconButton notificationButton() {
  return IconButton(
    icon: Stack(
      clipBehavior: Clip.none,
      children: [
        Center(
          child: Container(
            height: 56,
            width: 56,
            decoration: BoxDecoration(
              color: AppColors.orange.shade100,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Iconsax.notification,
              color: AppColors.darkGreen,
              size: 30,
            ),
          ),
        ),
        Positioned(
          top: 15,
          right: 15,
          child: Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              color: AppColors.orange,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ],
    ),
    onPressed: () {},
  );
}
