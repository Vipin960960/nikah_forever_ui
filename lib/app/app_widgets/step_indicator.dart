import 'package:flutter/material.dart';

import 'app_text_style.dart';

class StepIndicator extends StatelessWidget {
  final bool isActive;
  final int step;

  const StepIndicator({
    super.key,
    required this.isActive,
    required this.step,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: CircleAvatar(
        radius: 13,
        backgroundColor: isActive ? Colors.pinkAccent : Colors.grey[500],
        child: Center(
          child: CircleAvatar(
            radius: 11,
            backgroundColor: Colors.white,
            child: Text(
              step.toString(),
              style: AppTextStyle.custom(
                  fontSize: 12,
                  color: isActive ? Colors.pinkAccent : Colors.grey[500],
                  fontWeight: FontWeight.w300),
            ),
          ),
        ),
      ),
    );
  }
}
