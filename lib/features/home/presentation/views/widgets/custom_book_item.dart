import 'package:flutter/material.dart';

import '../../../../../core/utils/assets.dart';

class CustomBookItem extends StatelessWidget {
  const CustomBookItem({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.6 / 4,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(.2),
          borderRadius: BorderRadius.circular(15),
          image: const DecorationImage(
            image: AssetImage(
              AssetsData.Book1,
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
