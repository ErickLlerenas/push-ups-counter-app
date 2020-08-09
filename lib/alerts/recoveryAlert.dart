import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

class RecoveryAlert extends StatefulWidget{
  final double value;

  RecoveryAlert({Key key,this.value}): super(key: key);
  @override
  _RecoveryAlertState createState() => _RecoveryAlertState();
}

class _RecoveryAlertState extends State<RecoveryAlert> {

  Timer _timer;
  double _temp;
  double _recoveryPercent = 0;


    Path _buildHeartPath() {
    return Path()
      ..moveTo(55, 15)
      ..cubicTo(55, 12, 50, 0, 30, 0)
      ..cubicTo(0, 0, 0, 37.5, 0, 37.5)
      ..cubicTo(0, 55, 20, 77, 55, 95)
      ..cubicTo(90, 77, 110, 55, 110, 37.5)
      ..cubicTo(110, 37.5, 110, 0, 80, 0)
      ..cubicTo(65, 0, 55, 12, 55, 15)
      ..close();
  }
  @override
  void initState() {
    super.initState();
    _temp = widget.value;
  }
  @override
  Widget build(BuildContext context) {
    _recoveryPercent = 1 - (_temp/widget.value);
    print(_recoveryPercent);
    
  _startTimer() {
    if(_timer!=null){
      _timer.cancel();
    }
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
          
      if (_temp > 0) {
        setState(() {
          _temp--;
        });
        print(_temp);
      } else
      {
        _timer.cancel();
        Navigator.of(context).pop();
      }
    });

  }
  _startTimer();

    return AlertDialog(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[Text("Recovery Time")],
          ),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              LiquidCustomProgressIndicator(
                  shapePath: _buildHeartPath(),
                  value: _recoveryPercent, // Defaults to 0.5.
                  valueColor: AlwaysStoppedAnimation(Colors
                      .pink), // Defaults to the current Theme's accentColor.
                  backgroundColor: Colors
                      .pink[50], // Defaults to the current Theme's backgroundColor.
                  direction: Axis
                      .vertical, // The direction the liquid moves (Axis.vertical = bottom to top, Axis.horizontal = left to right). Defaults to Axis.vertical.
                  center: Text(
                    "${_temp.toInt()}",
                    style: TextStyle(fontSize: 20,color:Colors.white)
                  ))
            ],
          ),
        );
  }
}