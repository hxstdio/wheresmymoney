import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';

class NumberButton extends StatelessWidget {
  final int desc;
  var onPress;

  NumberButton({
    Key key ,
    @required this.desc,
    @required this.onPress,
  }):super(key:key);

  @override
  Widget build(BuildContext context) {  
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(right: 10.0),
        decoration: BoxDecoration(
          border: Border.all(width: 1.0, color: Color(0xFFE1E1E6)),
        ),
        child: MaterialButton(
          height: 64,
          onPressed: (){
            onPress(desc);
          },
          color: Color(0xFFF0F0F0),
          child: Text('$desc', style: TextStyle(
            fontSize: 20.0,
            color: Colors.black
          )),
        ),
      )
    );
  }
}

class NumberBtnRow extends StatelessWidget {
  final onPress;
  final List<int> numbers;

  NumberBtnRow({
    Key key ,
    @required this.onPress,
    @required this.numbers,
  }):super(key:key);

  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(top: 10.0),
        child: Row(
          children: numbers.map((e) => NumberButton(desc: e, onPress: onPress)).toList()
        ),
      ),
    );
  }
}

class NumberContainer extends StatelessWidget {
  final onPress;

  NumberContainer({
    Key key ,
    @required this.onPress,
  }):super(key:key);

  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          NumberBtnRow(numbers: [1, 2, 3], onPress: onPress),
          NumberBtnRow(numbers: [4, 5, 6], onPress: onPress),
          NumberBtnRow(numbers: [7, 8, 9], onPress: onPress),
          Expanded(
            child: Container(
              margin: const EdgeInsets.fromLTRB(0, 10.0, 10.0, 0),
              decoration: BoxDecoration(
                color: Colors.grey
              ),
              child: Row(
                // TODO9：the bottom buttons
              ),
            ),
          )
        ]
      ),
    );
  }
}