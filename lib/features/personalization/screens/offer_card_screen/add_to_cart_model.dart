import 'package:flutter/material.dart';

class AddToCart extends StatelessWidget {
  const AddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.redAccent),
        minimumSize: MaterialStateProperty.all<Size>(Size(270, 70)),
      ),
      onPressed: () {},
      child: Center(
        child: Text(
          'Add To Cart',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
