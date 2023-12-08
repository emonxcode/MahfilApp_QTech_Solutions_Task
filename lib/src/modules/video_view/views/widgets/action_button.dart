import 'package:flutter/material.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/sizes.dart';
import '../../../../widgets/app_text_widget.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({
    super.key,
    required this.width,
    required this.icon,
    required this.onTap,
    required this.label,
  });

  final double? width;
  final IconData icon;
  final String label;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 3),
        child: Container(
          height: 60,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.grey.shade300, width: 2),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 25,
                color: const Color.fromARGB(255, 196, 196, 196),
              ),
              AppSpace.spaceH4,
              AppTextWidget(
                text: label,
                color: AppColors.secondaryTextColor,
                fontSize: 12,
              )
            ],
          ),
        ),
      ),
    );
  }
}
