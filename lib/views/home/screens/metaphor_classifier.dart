import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:tamizhi/components/appbar.dart';
import 'package:tamizhi/components/custom_input.dart';
import 'package:tamizhi/theme/text.dart';
import 'package:tamizhi/theme/dimens.dart';

import '../../../theme/colors.dart';

class MetaphorClassifierScreen extends StatefulWidget {
  const MetaphorClassifierScreen({super.key});

  @override
  State<MetaphorClassifierScreen> createState() =>
      _MetaphorClassifierScreenState();
}

class _MetaphorClassifierScreenState extends State<MetaphorClassifierScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<Widget> _messages = [];
  bool isThinking = false;

  void _sendMessage() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;

    setState(() {
      _messages.add(_buildUserMessage(text));
      _controller.clear();
      isThinking = true;
      _messages.add(_buildAIThinkingMessage()); // Add thinking row
    });

    // Simulate receiving JSON response from backend
    Timer(const Duration(seconds: 2), () {
      final dummyJsonResponse = jsonEncode({
        "input_sentence": text,
        "classification": "Metaphor",
        "confidence": 92,
      });

      final Map<String, dynamic> response = jsonDecode(dummyJsonResponse);

      setState(() {
        // Replace the last message (thinking) with AI response
        _messages.removeLast();
        _messages.add(
          _buildAIMessageWithChart(
            "The input sentence is classified as a ${response['classification']} "
            "with ${response['confidence']}% confidence.",
            response['classification'],
            response['confidence'],
          ),
        );
        isThinking = false;
      });
    });
  }

  Widget _buildUserMessage(String text) {
    return Container(
      alignment: Alignment.centerRight,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.6,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: AppColors.black,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          text,
          style: AppTextStyles.body1.copyWith(color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildAIThinkingMessage() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundColor: Colors.black,
          radius: 18,
          child: Icon(Iconsax.magicpen, color: Colors.white, size: 18),
        ),
        const SizedBox(width: 8),
        Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.65,
          ),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              SizedBox(
                width: 16,
                height: 16,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
              SizedBox(width: 8),
              Text("AI is thinking..."),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAIMessageWithChart(String text, String label, int confidence) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundColor: Colors.black,
          radius: 18,
          child: Icon(Iconsax.magicpen, color: Colors.white, size: 18),
        ),
        const SizedBox(width: 8),
        Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.7,
          ),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text,
                style: AppTextStyles.body1.copyWith(color: Colors.black87),
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 150,
                child: PieChart(
                  PieChartData(
                    sections: [
                      PieChartSectionData(
                        value: confidence.toDouble(),
                        color: AppColors.orange,
                        title: "$confidence%",
                        radius: 50,
                        titleStyle: AppTextStyles.title3.copyWith(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                      PieChartSectionData(
                        value: 100 - confidence.toDouble(),
                        color: Colors.grey.shade300,
                        title: "${100 - confidence}%",
                        radius: 50,
                        titleStyle: AppTextStyles.title3.copyWith(
                          color: Colors.black54,
                          fontSize: 12,
                        ),
                      ),
                    ],
                    sectionsSpace: 0,
                    centerSpaceRadius: 0,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Container(
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                      color: AppColors.orange,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    "$label ($confidence%)",
                    style: AppTextStyles.body2.copyWith(color: Colors.black87),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              Row(
                children: [
                  Container(
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    "Literal (${100 - confidence}%)",
                    style: AppTextStyles.body2.copyWith(color: Colors.black87),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBarCustom(
        title: 'Metaphor Classifier',
        isActionIconVisible: true,
        actionIcon: Iconsax.menu_1,
        isLineVisible: false,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Color.fromARGB(255, 249, 181, 136)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: Dimens.defaultScreenMargin,
          vertical: Dimens.defaultScreenMarginSM,
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: 8),
                reverse: true,
                children: _messages.reversed.toList(),
              ),
            ),
            SafeArea(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: CustomTextInput(
                      controller: _controller,
                      hintText: "Enter Tamil sentence",
                    ),
                  ),
                  const SizedBox(width: 12),
                  GestureDetector(
                    onTap: _sendMessage,
                    child: CircleAvatar(
                      radius: 27,
                      backgroundColor: AppColors.orange,
                      child: Icon(
                        Iconsax.magicpen,
                        color: Colors.white,
                        size: 26,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
