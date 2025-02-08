import 'package:flutter/material.dart';

import '../../../../core/constant/styles.dart';
import '../../../../core/utils/helper.dart';

class ListGenresCardWidget extends StatelessWidget {
  final Map<String, dynamic> genre;

  const ListGenresCardWidget({
    super.key,
    required this.genre,
  });

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Stack(
        children: [
          Container(
            height: orientation == Orientation.landscape
                ? Helper.screeHeight(context) * 0.4
                : Helper.screeHeight(context) * 0.2,
            width: Helper.screeWidth(context) * 0.42,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            clipBehavior: Clip.antiAlias,
            child: Image(
              image: AssetImage(
                genre['image'],
              ),
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: Helper.screeWidth(context) * 0.42,
            decoration: Styles.linearBoxDecoration(),
          ),
          Positioned(
            bottom: 5,
            child: Container(
              padding: const EdgeInsets.all(10.0).copyWith(right: 0),
              width: Helper.screeWidth(context) * 0.40,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    genre['name'],
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.start,
                    style: Styles.textStyle(size: 17.5),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
