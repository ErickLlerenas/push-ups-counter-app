import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:flutter_native_admob/flutter_native_admob.dart';
import 'package:flutter_native_admob/native_admob_controller.dart';
import 'package:push_ups/alerts/recoveryAlert.dart';
import 'package:push_ups/alerts/congratsAlert.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static const _adUnitID = "ca-app-pub-2724614824004700/1001080815";
  final _nativeAdController = NativeAdmobController();

  int _counter = 0;
  int _lapsCounter = 0;
  double _pushUps = 12;
  double _laps = 4;
  double _percent = 0;
  double _lapsPercent = 0;
  double _recoveryTime = 15;

  countPushUps() {
    setState(() {
      _counter = _counter + 1;
      _percent = _counter / _pushUps;
    });
  }

  void _showCompletedDialog(context) {
    // flutter defined function
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        // return object of type Dialog
        return CongratulationAlert();
      },
    );
  }

  void _showRecoveryTimeDialog(context) {
    // flutter defined function
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        // return object of type Dialog
        return RecoveryAlert(value: _recoveryTime);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        drawer: Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text(
                  'Settings',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/push-up.png'),
                      fit: BoxFit.contain),
                  color: Colors.teal,
                ),
              ),
              ListTile(
                  title: Row(children: <Widget>[
                Text('Push ups:'),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    showValueIndicator: ShowValueIndicator.always,
                    activeTrackColor: Colors.red[700],
                    inactiveTrackColor: Colors.red[100],
                    trackShape: RoundedRectSliderTrackShape(),
                    trackHeight: 4.0,
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
                    thumbColor: Colors.redAccent,
                    overlayColor: Colors.red.withAlpha(32),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 28.0),
                    tickMarkShape: RoundSliderTickMarkShape(),
                    activeTickMarkColor: Colors.red[700],
                    inactiveTickMarkColor: Colors.red[100],
                    valueIndicatorShape: PaddleSliderValueIndicatorShape(),
                    valueIndicatorColor: Colors.redAccent,
                    valueIndicatorTextStyle: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  child: Slider(
                    value: _pushUps,
                    min: 8,
                    max: 50,
                    divisions: 42,
                    label: '${_pushUps.toInt()}',
                    onChanged: (value) {
                      setState(
                        () {
                          if (_counter >= _pushUps) {
                            _percent = 0;
                            _counter = 0;
                          }
                          _pushUps = value;
                        },
                      );
                    },
                  ),
                ),
              ])),
              ListTile(
                  title: Row(
                children: <Widget>[
                  Text('Laps:'),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      showValueIndicator: ShowValueIndicator.always,
                      activeTrackColor: Colors.red[700],
                      inactiveTrackColor: Colors.red[100],
                      trackShape: RoundedRectSliderTrackShape(),
                      trackHeight: 4.0,
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 12.0),
                      thumbColor: Colors.redAccent,
                      overlayColor: Colors.red.withAlpha(32),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 28.0),
                      tickMarkShape: RoundSliderTickMarkShape(),
                      activeTickMarkColor: Colors.red[700],
                      inactiveTickMarkColor: Colors.red[100],
                      valueIndicatorShape: PaddleSliderValueIndicatorShape(),
                      valueIndicatorColor: Colors.redAccent,
                      valueIndicatorTextStyle: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    child: Slider(
                      value: _laps,
                      min: 2,
                      max: 8,
                      divisions: 6,
                      label: '${_laps.toInt()}',
                      onChanged: (value) {
                        setState(
                          () {
                            if (_lapsCounter >= _laps) {
                              _lapsPercent = 0;
                              _lapsCounter = 0;
                            }
                            _laps = value;
                          },
                        );
                      },
                    ),
                  )
                ],
              )),
              ListTile(
                  title: Row(
                children: <Widget>[
                  Text('Recovery:'),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      showValueIndicator: ShowValueIndicator.always,
                      activeTrackColor: Colors.red[700],
                      inactiveTrackColor: Colors.red[100],
                      trackShape: RoundedRectSliderTrackShape(),
                      trackHeight: 4.0,
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 12.0),
                      thumbColor: Colors.redAccent,
                      overlayColor: Colors.red.withAlpha(32),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 28.0),
                      tickMarkShape: RoundSliderTickMarkShape(),
                      activeTickMarkColor: Colors.red[700],
                      inactiveTickMarkColor: Colors.red[100],
                      valueIndicatorShape: PaddleSliderValueIndicatorShape(),
                      valueIndicatorColor: Colors.redAccent,
                      valueIndicatorTextStyle: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    child: Slider(
                      value: _recoveryTime,
                      min: 10,
                      max: 60,
                      divisions: 50,
                      label: '${_recoveryTime.toInt()}',
                      onChanged: (value) {
                        setState(
                          () {
                            _recoveryTime = value;
                          },
                        );
                      },
                    ),
                  ),
                ],
              )),
              Container(
                height: 330,
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(bottom: 20.0),
                child: NativeAdmob(
                  // Your ad unit id
                  adUnitID: _adUnitID,
                  controller: _nativeAdController,
                  type: NativeAdmobType.full,
                ),
              )
            ],
          ),
        ),
        appBar: PreferredSize(
            child: AppBar(
                title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Push up counter'),
                Image.asset(
                  'assets/workout.png',
                  fit: BoxFit.contain,
                  width: 120,
                )
              ],
            )),
            preferredSize: Size.fromHeight(50)),
        body: Stack(
          children: <Widget>[
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              Container(
                  margin: EdgeInsets.only(top: 50),
                  child: Text('Tap the buttom with your nose',
                      style: TextStyle(fontSize: 18, color: Colors.grey[500])))
            ]),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                          color: Colors.blue.withOpacity(0),
                          spreadRadius: -14,
                          blurRadius: 0,
                          offset: Offset(0, 0), // changes position of shadow
                        )
                      ], borderRadius: BorderRadius.all(Radius.circular(1000))),
                      padding: EdgeInsets.all(15),
                      height: width,
                      width: width,
                      child: InkWell(
                          borderRadius: BorderRadius.all(Radius.circular(1000)),
                          onTap: () {
                            setState(() {
                              countPushUps();
                              if (_counter == _pushUps) {
                                _percent = 0;
                                _counter = 0;
                                _lapsCounter++;
                                _lapsPercent = _lapsCounter / _laps;
                                if (_lapsCounter != _laps)
                                  _showRecoveryTimeDialog(context);
                              }
                              if (_lapsCounter == _laps) {
                                _lapsPercent = 0;
                                _lapsCounter = 0;
                                _showCompletedDialog(context);
                              }
                            });
                          },
                          child: LiquidCircularProgressIndicator(
                            value: _percent, // Defaults to 0.5.
                            valueColor: AlwaysStoppedAnimation(Colors
                                .blue), // Defaults to the current Theme's accentColor.
                            backgroundColor: Colors.blue[
                                100], // Defaults to the current Theme's backgroundColor.
                            direction: Axis
                                .vertical, // The direction the liquid moves (Axis.vertical = bottom to top, Axis.horizontal = left to right). Defaults to Axis.vertical.
                            center: Text(
                              "$_counter/${_pushUps.toInt()}",
                              style:
                                  TextStyle(fontSize: 30, color: Colors.white),
                            ),
                          )),
                    )
                  ],
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(20),
                  height: 100,
                  child: LiquidLinearProgressIndicator(
                    value: _lapsPercent, // Defaults to 0.5.
                    valueColor: AlwaysStoppedAnimation(Colors
                        .teal), // Defaults to the current Theme's accentColor.
                    backgroundColor: Colors.teal[
                        100], // Defaults to the current Theme's backgroundColor.
                    borderRadius: 12.0,
                    direction: Axis
                        .horizontal, // The direction the liquid moves (Axis.vertical = bottom to top, Axis.horizontal = left to right). Defaults to Axis.horizontal.
                    center: Text(
                      "$_lapsCounter/${_laps.toInt()}",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                )
              ],
            )
          ],
        ));
  }
}
