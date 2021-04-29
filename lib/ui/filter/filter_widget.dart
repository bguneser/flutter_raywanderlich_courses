import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FilterWidget extends StatelessWidget {

  final int value;
  final int groupValue;
  final ValueChanged<int> onChanged ;
  final String text ;


  FilterWidget({Key key,
    @required this.value,
    @required  this.groupValue,
    @required this.onChanged,
    @required  this.text}) :super(key: key);

  @override
  Widget build(BuildContext context) {

    return Row(
      children: [
        Radio(
          value : value,
          groupValue:groupValue,
          onChanged:onChanged
        ),
        Text(
          text,
          style: TextStyle(fontSize: 16.0),
        )
      ],
    );



  }
}