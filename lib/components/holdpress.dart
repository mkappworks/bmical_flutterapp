import 'package:flutter/material.dart';

class HoldPress extends StatefulWidget {
  @override
  _HoldPressState createState() => _HoldPressState();
}

class _HoldPressState extends State<HoldPress> {
  int _counter = 0;

  bool _buttonPressed = false;
  bool _loopActive = false;

  int buttonHoldDelay;
  int buttonHoldIncrement;

  _HoldPressState({this.buttonHoldDelay, this.buttonHoldIncrement});

  void _increaseCounterWhilePressed() async {
    // make sure that only one loop is active
    if (_loopActive) return;

    _loopActive = true;

    while (_buttonPressed) {
      // do your thing
      setState(() {
        _counter = _counter + buttonHoldIncrement;
      });

      // wait a bit
      await Future.delayed(Duration(milliseconds: buttonHoldDelay));
    }

    _loopActive = false;
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (details) {
        _buttonPressed = true;
        _increaseCounterWhilePressed();
      },
      onPointerUp: (details) {
        _buttonPressed = false;
      },
      child: Container(
        decoration: BoxDecoration(color: Colors.orange, border: Border.all()),
        padding: EdgeInsets.all(16.0),
        child: Text('Value: $_counter'),
      ),
    );
  }
}
