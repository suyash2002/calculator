import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:calculator/widgets/button.dart';
import 'package:math_expressions/math_expressions.dart';

void main() => runApp(app());

class app extends StatefulWidget {
  @override
  _appState createState() => _appState();
}

class _appState extends State<app> {
  String _history = '';
  String _textToDisplay = '';

  void numClick(String btnVal) {
    setState(() {
      _textToDisplay += btnVal;
    });
  }

  void AllClear(String btnVal) {
    setState(() {
      _history = '';
      _textToDisplay = '';
    });
  }

  void Clear(String btnVal) {
    setState(() {
      _textToDisplay = '';
    });
  }

  void evaluate(String btnVal) {
    Parser p = Parser();
    Expression exp = p.parse(_textToDisplay);
    ContextModel cm = ContextModel();
    setState(() {
      _history = _textToDisplay;
      _textToDisplay = exp.evaluate(EvaluationType.REAL, cm).toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text(
              "Calculator",
              style: TextStyle(fontFamily: 'Sofia', fontSize: 30),
            ),
            centerTitle: true,
            backgroundColor: const Color(0xFFFB79CED),
          ),
          backgroundColor: const Color(0xFFF957FEF),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                  alignment: Alignment(1, 1),
                  padding: EdgeInsets.only(right: 20),
                  child: Text(
                    "$_history",
                  )),
              Container(
                alignment: Alignment(1, 1),
                padding: EdgeInsets.all(20),
                child: Text(
                  "$_textToDisplay",
                  style: TextStyle(
                      color: Colors.white, fontSize: 30, fontFamily: 'Poppins'),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalBut(
                      text: 'AC',
                      fillColor: 0xFFFEFD9CE,
                      textColor: 0xFFF000000,
                      CallBack: AllClear),
                  CalBut(
                      text: 'C',
                      fillColor: 0xFFFEFD9CE,
                      textColor: 0xFFF000000,
                      CallBack: Clear),
                  CalBut(
                      text: '<',
                      fillColor: 0xFFFEFD9CE,
                      textColor: 0xFFF000000,
                      CallBack: Clear),
                  CalBut(
                      text: '/',
                      fillColor: 0xFFFEFD9CE,
                      textColor: 0xFFF000000,
                      CallBack: numClick),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalBut(
                    text: '7',
                    fillColor: 0xFFFDEC0F1,
                    textColor: 0xFFF000000,
                    CallBack: numClick,
                  ),
                  CalBut(
                    text: '8',
                    fillColor: 0xFFFDEC0F1,
                    textColor: 0xFFF000000,
                    CallBack: numClick,
                  ),
                  CalBut(
                    text: '9',
                    fillColor: 0xFFFDEC0F1,
                    textColor: 0xFFF000000,
                    CallBack: numClick,
                  ),
                  CalBut(
                      text: '*',
                      fillColor: 0xFFFEFD9CE,
                      textColor: 0xFFF000000,
                      CallBack: numClick),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalBut(
                    text: '4',
                    fillColor: 0xFFFDEC0F1,
                    textColor: 0xFFF000000,
                    CallBack: numClick,
                  ),
                  CalBut(
                    text: '5',
                    fillColor: 0xFFFDEC0F1,
                    textColor: 0xFFF000000,
                    CallBack: numClick,
                  ),
                  CalBut(
                    text: '6',
                    fillColor: 0xFFFDEC0F1,
                    textColor: 0xFFF000000,
                    CallBack: numClick,
                  ),
                  CalBut(
                      text: '-',
                      fillColor: 0xFFFEFD9CE,
                      textColor: 0xFFF000000,
                      CallBack: numClick),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalBut(
                    text: '1',
                    fillColor: 0xFFFDEC0F1,
                    textColor: 0xFFF000000,
                    CallBack: numClick,
                  ),
                  CalBut(
                    text: '2',
                    fillColor: 0xFFFDEC0F1,
                    textColor: 0xFFF000000,
                    CallBack: numClick,
                  ),
                  CalBut(
                    text: '3',
                    fillColor: 0xFFFDEC0F1,
                    textColor: 0xFFF000000,
                    CallBack: numClick,
                  ),
                  CalBut(
                      text: '+',
                      fillColor: 0xFFFEFD9CE,
                      textColor: 0xFFF000000,
                      CallBack: numClick),
                ],
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CalBut(
                      text: '.',
                      fillColor: 0xFFFDEC0F1,
                      textColor: 0xFFF000000,
                      CallBack: numClick,
                    ),
                    CalBut(
                      text: '00',
                      fillColor: 0xFFFDEC0F1,
                      textColor: 0xFFF000000,
                      CallBack: numClick,
                    ),
                    CalBut(
                      text: '0',
                      fillColor: 0xFFFDEC0F1,
                      textColor: 0xFFF000000,
                      CallBack: numClick,
                    ),
                    CalBut(
                        text: '=',
                        fillColor: 0xFFFEFD9CE,
                        textColor: 0xFFF000000,
                        CallBack: evaluate),
                  ],
                ),
              ),
            ],
          )),
      debugShowCheckedModeBanner: false,
    );
  }
}
