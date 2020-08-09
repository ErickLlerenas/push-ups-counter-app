import 'package:flutter/material.dart';

class CongratulationAlert extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Congratulations!"),
            ],
          ),
          content: Container(
            height: 150,
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                        width: 100,
                        height: 100,
                        child: Image.asset(
                          'assets/congratulation.png',
                          fit: BoxFit.contain,
                        ))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FlatButton(
                      color: Colors.pink,
                      child: Text(
                        "Done",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        );
  }
}