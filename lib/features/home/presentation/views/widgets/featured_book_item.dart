import 'package:flutter/material.dart';

import '../../../../../core/utils/assets.dart';

class FeaturedBookItem extends StatelessWidget {
  const FeaturedBookItem({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.5 / 2.2,
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
