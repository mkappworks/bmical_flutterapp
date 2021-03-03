import 'dart:math';

class BMICal {
  final int height;
  final int weight;

  double _bmi;

  BMICal({this.height, this.weight});

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    return _bmi >= 25 ? 'Overweight' : _bmi > 18.5 ? 'Normal' : 'Underweight';
  }

  String getInterpretation() {
    return _bmi >= 25
        ? 'You have a higher than normal body weight. Try to excercise more'
        : _bmi > 18.5
            ? 'You have a normal body weight. Good job!'
            : 'You have a lower than normal body weight. You can eat a bit more';
  }
}
