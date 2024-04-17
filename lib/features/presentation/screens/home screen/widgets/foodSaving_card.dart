import 'package:flutter/material.dart';

class foodsaving_card extends StatelessWidget {
  const foodsaving_card({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {},
        child: Padding(
            padding: EdgeInsets.only(top: 16, bottom: 16, right: 16, left: 10),
            child: Container(
                height: 160,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  image: DecorationImage(
                      image: AssetImage('assets/images/foodsaving card.jpeg'),
                      fit: BoxFit.fill),
                ))));
  }
}
