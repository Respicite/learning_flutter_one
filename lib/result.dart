import 'package:flutter/material.dart';

class Result extends StatelessWidget {
final message;
final Function selectHandler;

  Result({ this.message, this.selectHandler});

  String get scoreMessage {
    String flair;

    if(message < 0 ) { flair = 'Disgusting!'; }
    else if(message < 10 ) { flair = 'Meh...'; }
    else if(message < 20 ) { flair = 'Well done.'; }
    else { flair = 'Awesome!'; }

    return "You archived $message points. $flair";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(50),
      alignment: Alignment.center,
      child: Column(
        children: [ Text('Quiz done!', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),),
        Text(scoreMessage),
          FlatButton(onPressed: selectHandler, child: Text('Retry'))
      ],),
    );
  }
}
