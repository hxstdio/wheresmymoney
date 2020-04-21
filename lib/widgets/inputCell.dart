import 'package:flutter/material.dart';
import './numberButton.dart';

class InputCell extends StatelessWidget {
  
  InputCell({
    Key key ,
  }):super(key:key);

  _onPressNumber(e){
    print('pressed: $e');
  }

  @override
  Widget build(BuildContext context) {  
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 370.0,
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Color(0xFFEBEBF2),
            ),
            child: Column(
              children: [
                Container(
                  height: 40.0,
                  decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(width: 1, color: Color(0xFFE1E1E6)))
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        '0', // TODO6: input value from local state
                        style: TextStyle(
                          fontSize: 22.0
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          print('TODO: delete input value from local state');
                        },
                        child: Container(
                          margin: const EdgeInsets.only(left: 10.0),
                          child: Icon(Icons.close, color: Colors.grey),
                        )
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: NumberContainer(onPress: _onPressNumber)
                        ),
                        Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.fromLTRB(0, 10.0, 0, 10.0),
                              decoration: BoxDecoration(
                                color: Colors.grey
                              ),
                              child: MaterialButton(
                                minWidth: 100.0,
                                height: 140.0,
                                onPressed: (){
                                  // TODO2: delete the input value
                                },
                                color: Colors.grey,
                                child: Text('删', style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.white
                                )),
                              ),
                            ),
                            MaterialButton(
                              minWidth: 100.0,
                              height: 140.0,
                              onPressed: (){
                                // TODO1: insert new record to sqflite
                              },
                              color: Color(0xFF1790C3),
                              child: Text('完成', style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.white
                              )),
                            )
                          ]
                        )
                      ],
                    ),
                  )
                )
              ]
            )
          ),
        ),
      ],
    );
  }
}