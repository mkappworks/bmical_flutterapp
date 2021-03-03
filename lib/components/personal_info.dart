import '../constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'round_icon_button.dart';

class PersonalInfo extends StatelessWidget {
  int itemvalue;
  String itemname;
  Function onButtonTapMinus;
  Function onButtonTapAdd;
  Function onLongPressMinus;
  Function onLongPressAdd;

  PersonalInfo(
      {this.itemvalue,
      this.itemname,
      this.onButtonTapMinus,
      this.onButtonTapAdd,
      this.onLongPressMinus,
      this.onLongPressAdd});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          itemname,
          style: kLabelTextStyle,
        ),
        Text(
          itemvalue.toString(),
          style: kNumberTextStyle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RoundIconButton(
              icon: FontAwesomeIcons.minus,
              onButtonTap: onButtonTapMinus,
              onButtonLongPress: onLongPressMinus,
            ),
            SizedBox(
              width: 10.0,
            ),
            RoundIconButton(
              icon: FontAwesomeIcons.plus,
              onButtonTap: onButtonTapAdd,
            ),
          ],
        )
      ],
    );
  }
}
