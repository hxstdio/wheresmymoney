import 'package:flutter/material.dart';
import 'package:wheresmymoney/widgets/inputCell.dart';
import 'package:wheresmymoney/widgets/typeSelectCell.dart';

class AddRecord extends StatefulWidget{
  @override
  _AddRecordState createState() => _AddRecordState();
}

class _AddRecordState extends State<AddRecord> {
  bool isAddCost = true;

  _onSubmit(double amount) {
    print(amount);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('记一笔'),
        centerTitle: false,
        actions: [
          Container(
            padding: const EdgeInsets.only(right: 12.0),
            child: Row(
              children: [
                Switch(
                  value: this.isAddCost,
                  onChanged: (bool val){
                    this.setState(() {
                      this.isAddCost = ! this.isAddCost;
                    });
                  }
                ),
                Text('${this.isAddCost ? "支出" : "收入"}')
              ],
            ),
          )
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.blueGrey,
        ),
        child: Column(
          children: [
            TypeSelectCell(isCost: this.isAddCost),
            InputCell(onSubmit: _onSubmit)
          ],
        ),
      )
    );
  }
}