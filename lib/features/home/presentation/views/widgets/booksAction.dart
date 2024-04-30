import 'package:bookly_app/core/utils/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          CustomButton(
            backgroundColor: Colors.white,
            textColor: Colors.black,
            borderRadius: BorderRadiusDirectional.only(
              topStart: Radius.circular(12),
              bottomStart: Radius.circular(12),
            ),
            text: '19.99\$',
          ),
          CustomButton(
            backgroundColor: Color(0xffEF8262),
            textColor: Colors.white,
            borderRadius: BorderRadiusDirectional.only(
              topEnd: Radius.circular(12),
              bottomEnd: Radius.circular(12),
            ),
            text: 'Free Preview',
          ),
        ],
      ),
    );
  }
}
