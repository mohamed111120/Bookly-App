import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/utils/styles.dart';

class BookRating extends StatelessWidget {

  const BookRating({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          FontAwesomeIcons.solidStar,
          color: Color(0xffFFDD4F),
          size: 18,
        ),
        SizedBox(width: 6.3,),
        Text(
          '4.8',
          style: Styles.textStyle16,
        ),
        SizedBox(width: 9,),
        Opacity(
          opacity: .5,
          child: Text(
            '(2450)',
            style: Styles.textStyle16,
          ),
        ),
      ],
    );
  }
}
