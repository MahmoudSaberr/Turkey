import 'package:flutter/material.dart';
import 'package:pen/Screens/ThankYouScreen/Widgets/thank_you_view.dart';

class ThankYouView extends StatelessWidget {
  const ThankYouView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Transform.translate(
          offset: const Offset(0, -16), child: const ThankYouViewBody()),
    );
  }
}