import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tamizhi/components/margin.dart';
import 'package:tamizhi/theme/colors.dart';
import 'package:tamizhi/theme/dimens.dart';
import 'package:tamizhi/theme/text.dart';
import 'package:tamizhi/views/home/widgets/history_card.dart';

import '../widgets/generate_card.dart';
import '../widgets/metaphor_card.dart';
import '../widgets/notification_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final cardWidth = (screenWidth - 64 - 16) / 2;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CircleAvatar(
                radius: 28,
                backgroundColor: AppColors.black,
                child: Text(
                  'V',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              notificationButton(),
            ],
          ),
        ),
      ),

      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.white, Color.fromARGB(255, 249, 181, 136)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: Dimens.defaultScreenMargin,
          vertical: Dimens.defaultScreenMargin,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Hello, ",
                      style: AppTextStyles.headline0.copyWith(
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    TextSpan(
                      text: "Vimosh!",
                      style: AppTextStyles.headline0.copyWith(
                        fontWeight: FontWeight.w500,
                        color: Colors.deepOrange,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                "How can I assist you today?",
                style: AppTextStyles.headline5.copyWith(
                  fontWeight: FontWeight.w300,
                ),
              ),
              Margin(),
              Row(
                children: [
                  GenerateCard(
                    width: cardWidth,
                    icon: Iconsax.music,
                    title: "Generate Tamil lyrics based on mood and theme.",
                    buttonText: "Generate",
                    onTap: () {},
                  ),
                  SizedBox(width: 16),
                  Column(
                    children: [
                      MetaphorCard(
                        width: cardWidth,
                        icon: Iconsax.magicpen,
                        title: "Metaphor Classifier",
                        buttonText: "Generate",
                        onTap: () {
                          print("Navigating to Metaphor Classifier");
                          context.push('/metaphor-classifier');
                        },
                      ),
                      SizedBox(height: 16),
                      MetaphorCard(
                        width: cardWidth,
                        icon: Icons.auto_awesome,
                        title: "Metaphor Creator",
                        buttonText: "Generate",
                        onTap: () {},
                      ),
                    ],
                  ),
                ],
              ),
              Margin(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Recent History",
                    style: AppTextStyles.body1,
                  ),
                  Text(
                    "See all",
                    style: AppTextStyles.body3.copyWith(color: Colors.black54),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const HistoryCard(
                icon: Iconsax.magicpen,
                text: "Classified 3 Tamil sentences today",
              ),
              const HistoryCard(
                icon: Iconsax.magicpen,
                text: "Created song using AI’s suggested emotions",
              ),
            ],
          ),
        ),
      ),
    
    );
  }
}
