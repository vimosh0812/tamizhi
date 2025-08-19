import 'package:flutter/material.dart';

class MetaphorClassifierScreen extends StatelessWidget {
  const MetaphorClassifierScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Metaphor Classifier'),
      ),
      body: const Center(
        child: Text(
          'Welcome to the Metaphor Classifier!',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}