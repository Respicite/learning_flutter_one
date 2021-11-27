import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Map answer;
  final Function selectHandler;

  Answer({ this.answer, this.selectHandler});

  @override
  Widget build(BuildContext context) {

    return Container(
      child: RaisedButton(
        child: Text(answer['text']),
        onPressed: () => { selectHandler(answer['score']) },
        textColor: Colors.white,
        color: Colors.blue,
      ),
      width: double.infinity,
      margin: EdgeInsets.only(left: 50, right: 50, top: 5, bottom: 5),
    );
  }
}
