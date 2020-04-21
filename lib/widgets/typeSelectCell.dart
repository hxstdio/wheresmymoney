import 'package:flutter/material.dart';

class TypeSelectCell extends StatelessWidget {
  
  TypeSelectCell({
    Key key ,
  }):super(key:key);

  @override
  Widget build(BuildContext context) {  
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Expanded(
          child: Column(
            children: [
              Row(
                children: [
                  Text('123'),
                  Text('123'),
                  Text('123')
                ]
              ),
              Text('31')
            ]
          ),
        )
      ),
    );
  }
}