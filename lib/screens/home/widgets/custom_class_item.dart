import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../../core/resources/app_colors.dart';

class CustomClassItem extends StatelessWidget {
  const CustomClassItem({
    super.key,
    required this.className,
    this.onTap,
  });
  final String className;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return SlideAnimation(
        verticalOffset: 50.0,
        child: InkWell(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.symmetric(vertical: 7),
            decoration: const BoxDecoration(
              color: AppColors.primaryColorLight,
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(className,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: AppColors.colorWhite)),
                const Icon(
                  Icons.arrow_forward_ios,
                  color: AppColors.colorWhite,
                ),
              ],
            ),
          ),
        ));
  }
}
