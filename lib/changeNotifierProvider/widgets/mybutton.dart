import 'package:flutter/material.dart';
import 'package:flutter_bloc_provider/changeNotifierProvider/model/goodBye.dart';
import 'package:provider/provider.dart';

class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final myModel = Provider.of<GoodBye>(context, listen: false);

    return RaisedButton(
      child: Text('Do something'),
      onPressed: () {
        myModel.sayGoodBye('Goodbye');
      },
    );
  }
}