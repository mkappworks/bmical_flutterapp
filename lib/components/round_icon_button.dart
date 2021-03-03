import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final Function onButtonTap;
  final Function onButtonLongPress;

  RoundIconButton(
      {@required this.icon,
      @required this.onButtonTap,
      this.onButtonLongPress});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onButtonTap,
      onLongPress: onButtonLongPress,
      elevation: 0.0,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      child: Icon(icon),
    );
  }
}
