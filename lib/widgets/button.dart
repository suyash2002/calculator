import 'package:flutter/material.dart';

class CalBut extends StatelessWidget {
  final String text;
  final int fillColor;
  final int textColor;

  final Function CallBack;
  const CalBut({this.text, this.fillColor, this.textColor, this.CallBack});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            offset: Offset(5, 5),
          )
        ],
        color: Color(fillColor),
        borderRadius: BorderRadius.circular(20),
      ),
      child: FlatButton(
        child: Text(
          '$text',
          style: TextStyle(color: Color(textColor), fontSize: 17),
        ),
        onPressed: () {
          CallBack('$text');
        },
      ),
      height: 60,
      width: 60,
    );
  }
}
