import 'package:flutter/material.dart';

import '../../../core/resources/app_colors.dart';

class CustomCardNews extends StatelessWidget {
  const CustomCardNews({
    required this.path,
    required this.text,
    super.key,
  });
  final String path;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Container(
          width: MediaQuery.sizeOf(context).width * .9,
          height: MediaQuery.sizeOf(context).height * .25,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
              image: 
              NetworkImage(
                path,
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: LayoutBuilder(builder: (context, constrains) {
            return Stack(
              children: [
                Align(
                  alignment: AlignmentDirectional.bottomCenter,
                  child: Container(
                    height: constrains.maxHeight * 0.4,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(0, 10, 10, 10),
                          Colors.black,
                        ],
                        begin: FractionalOffset(0.0, 0.0),
                        end: FractionalOffset(0.0, 1.0),
                        stops: [0.0, 1.0],
                        tileMode: TileMode.clamp,
                        // transform:GradientTransform),
                      ),
                    ),
                  ),
                ),
                Align(
                    alignment: AlignmentDirectional.bottomStart,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        text,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: AppColors.colorWhite,
                            fontWeight: FontWeight.w600),
                      ),
                    )),
              ],
            );
          })),
    );
  }
}

class NewsFeed {
  final String pathImage;
  final String text;

  NewsFeed({required this.pathImage, required this.text});
}
