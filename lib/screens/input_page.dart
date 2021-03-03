import 'package:bmical_flutterapp/bmi_cal.dart';
import 'result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../components/bottombutton.dart';
import '../components/icon_content.dart';
import '../components/personal_info.dart';
import '../components/reusable_card.dart';
import '../constants.dart';

enum GenderType { Male, Female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  GenderType selectedGender = GenderType.Male;
  int height = 180;
  int age = 18;
  int weight = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          //Gender Selector Layout
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onCardPress: () {
                      setState(() {
                        selectedGender = GenderType.Male;
                      });
                    },
                    colour: selectedGender == GenderType.Male
                        ? kActiveCardColour
                        : kInactiveCardColour,
                    cardChild: IconContent(
                      iconType: FontAwesomeIcons.male,
                      iconText: 'Male',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onCardPress: () {
                      setState(() {
                        selectedGender = GenderType.Female;
                      });
                    },
                    colour: selectedGender == GenderType.Female
                        ? kActiveCardColour
                        : kInactiveCardColour,
                    cardChild: IconContent(
                      iconType: FontAwesomeIcons.female,
                      iconText: 'Female',
                    ),
                  ),
                ),
              ],
            ),
          ),
          //Height Slider layout
          Expanded(
            child: ReusableCard(
              colour: kActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      Text(
                        ' cm',
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                      thumbColor: Color(0xFFEB1555),
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xFF8D8E98),
                      overlayColor: Color(0x29EB1555),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: kMinHeightValue,
                      max: kMaxHeightValue,
                      onChanged: (double newSliderValue) {
                        setState(() {
                          height = newSliderValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          //Personal Info layout
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColour,
                    cardChild: PersonalInfo(
                      itemname: 'WEIGHT',
                      itemvalue: weight,
                      onButtonTapMinus: () {
                        setState(() {
                          weight--;
                        });
                      },
                      onButtonTapAdd: () {
                        setState(() {
                          weight++;
                        });
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColour,
                    cardChild: PersonalInfo(
                      itemname: 'AGE',
                      itemvalue: age,
                      onLongPressMinus: () {
                        setState(() {
                          age = age - 5;
                        });
                      },
                      onButtonTapMinus: () {
                        setState(() {
                          age--;
                        });
                      },
                      onLongPressAdd: () {
                        setState(() {
                          // HoldPress holdpress = HoldPress(onHo)
                        });
                      },
                      onButtonTapAdd: () {
                        setState(() {
                          age++;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            onBottomButtonTap: () {
              BMICal bmical = BMICal(height: height, weight: weight);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultPage(
                            bmiResult: bmical.calculateBMI(),
                            resultText: bmical.getResult(),
                            interpretation: bmical.getInterpretation(),
                          )));
            },
            buttonText: 'CALCULATE',
          ),
        ],
      ),
    );
  }
}
