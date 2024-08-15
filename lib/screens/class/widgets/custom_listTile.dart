import 'package:flutter/material.dart';

import '../../../core/resources/app_colors.dart';

Widget customListTile(
    {required String title,
    required Function downloadButton,
    required Function viewButton}) {
  return InkWell(
    onTap: () {
      viewButton();
    },
    child: ListTile(
      title: Text(title),
      trailing: IconButton(
        icon: const Icon(
          Icons.download,
          color: AppColors.primaryColorLight,
        ),
        onPressed: () {
          downloadButton();
        },
      ),
    ),
  );
}
