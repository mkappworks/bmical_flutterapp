import 'package:flutter/material.dart';

import '../constants.dart';

class BottomButton extends StatelessWidget {
  final Function onBottomButtonTap;
  final String buttonText;

  BottomButton({@required this.onBottomButtonTap, @required this.buttonText});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onBottomButtonTap,
      child: Container(
        color: kBottomContainerColour,
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: kBottomContainerHeight,
        padding: EdgeInsets.only(bottom: 20.0),
        child: Center(
          child: Text(
            buttonText,
            style: kLargeButtonTextStyle,
          ),
        ),
        //child: TextTheme(),
      ),
    );
  }
}
