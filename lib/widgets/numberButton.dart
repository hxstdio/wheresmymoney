import 'package:flutter/material.dart';

const double HardCodeHeight = 64.0;

class NumberButton extends StatelessWidget {
  final String desc;
  final onPress;

  NumberButton({
    Key key ,
    @required this.desc,
    @required this.onPress,
  }):super(key:key);

  @override
  Widget build(BuildContext context) {  
    return Expanded(
      flex: 1,
      child: Container(
        margin: EdgeInsets.only(top: 10.0),
        child: MaterialButton(
          height: HardCodeHeight,
          onPressed: (){
            onPress(desc);
          },
          color: Color(0xFFF0F0F0),
          child: Text(desc, style: TextStyle(
            fontSize: 20.0,
            color: Colors.black
          )),
        ),
      )
    );
  }
}

class NumberBtnColumn extends StatelessWidget {
  final onPress;
  final List<String> numbers;

  NumberBtnColumn({
    Key key ,
    @required this.onPress,
    @required this.numbers,
  }):super(key:key);

  Widget build(BuildContext context) {
    List<Widget> numberButtons = []; 
    numbers.asMap().forEach((key, value) {
      numberButtons.add(NumberButton(desc: value, onPress: onPress));
    });

    return Expanded(
      child: Container(
        child: Column(
          children: numberButtons
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
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 10.0, 0),
              child: Column(
                children: [
                  NumberBtnColumn(numbers: ['1', '4', '7', '.'], onPress: onPress),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              child: Column(
                children: [
                  Expanded(
                    flex: 3,
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.fromLTRB(0, 0, 10.0, 0),
                            child: Column(
                              children: [
                                NumberBtnColumn(numbers: ['2', '5', '8'], onPress: onPress),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.fromLTRB(0, 0, 10.0, 0),
                            child: Column(
                              children: [
                                NumberBtnColumn(numbers: ['3', '6', '9'], onPress: onPress),
                              ],
                            ),
                          ),
                        ),
                      ]
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 10.0, 0),
                      child: Row(
                        children: [NumberButton(desc: '0', onPress: onPress)]
                      )
                    )
                  )
                ]
              ),
            ),
          ),
        ],
      ),
    );
  }
}