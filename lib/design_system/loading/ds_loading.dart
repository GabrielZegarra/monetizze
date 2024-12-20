import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

import '../design_system.dart';
class DSLoading extends StatefulWidget {
  const DSLoading({super.key});

  @override
  State<DSLoading> createState() => _DSLoadingState();
}

class _DSLoadingState extends State<DSLoading> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        width: 100,
        height: 100,
        child: LoadingIndicator(
            indicatorType: Indicator.ballSpinFadeLoader,
            colors: [DSColors.primary],
            strokeWidth: 2,
            backgroundColor: Colors.transparent,
            pathBackgroundColor: Colors.transparent
        ),
      ),
    );
  }
}
