import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListHeader extends StatelessWidget {
  const ListHeader({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final Shader linearGradient = LinearGradient(
      colors: <Color>[Get.theme.primaryColor, const Color(0xff50CE56)],
    ).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            // spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                foreground: Paint()..shader = linearGradient),
          ),
          SizedBox(
            child: Image.asset(
              'assets/images/header_img.png',
              width: 100,
              height: 100,
            ),
          )
        ],
      ),
    );
  }
}
