import 'package:flutter/material.dart';

class ListTileOwn extends StatelessWidget {
  final String value;

  const ListTileOwn({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 39,
      decoration: ShapeDecoration(
        color: const Color(0xFF102E6A),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25)
        ),
      ),
      child: Center(
        child: Text(
          value!,
          textAlign: TextAlign.center,
          style: const TextStyle(
              color: Colors.white
          ),
        ),
      ),
    );
  }

}