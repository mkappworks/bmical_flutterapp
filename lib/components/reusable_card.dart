import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color colour;
  final Widget cardChild;
  final Function onCardPress;

  ReusableCard({this.cardChild, @required this.colour, this.onCardPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onCardPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: colour //Color(0xFF1D1E33),
            ),
      ),
    );
  }
}
