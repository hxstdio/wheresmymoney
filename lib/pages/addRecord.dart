import 'package:flutter/material.dart';
import 'package:wheresmymoney/utils/constants.dart';
import 'package:wheresmymoney/widgets/inputCell.dart';
import 'package:wheresmymoney/widgets/typeSelectCell.dart';
import '../models/db.dart';
import '../models/record.dart';

class AddRecord extends StatefulWidget{
  @override
  _AddRecordState createState() => _AddRecordState();
}

class _AddRecordState extends State<AddRecord> {
  bool isAddCost;
  DateTime currentDay;
  int subType;

  var db = DataBaseHelper();

  @override
  void initState() {
    isAddCost = true;
    currentDay = DateTime.now();
    subType = 0;
    super.initState();
    db.getTotalList().then((value) => print(value));
  }

  void _onSubmit(double amount) {
    Record record = new Record();
    record.amount = amount;
    record.type = this.isAddCost ? 0 : 1;
    record.subType = this.subType;
    record.name = this.isAddCost ? costIconMapping[subType]['name'] : incomeIconMapping[subType]['name'];
    record.id = DateTime.now().millisecondsSinceEpoch;
    record.createDate = this.currentDay.millisecondsSinceEpoch;

    db.saveItem(record);
    Navigator.pop(context);
  }

  void _handleDayChanged(DateTime selectedDateTime) {
    this.setState(() {
      this.currentDay = selectedDateTime;
    });
  }

  void _handleSubTypeSelected(int subType) {
    this.setState(() {
      this.subType = subType;
    });
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
          color: Colors.white,
        ),
        child: Column(
          children: [
            TypeSelectCell(
              isCost: this.isAddCost, 
              currentDay: this.currentDay,
              selectedSubType: this.subType,
              onDayChanged: this._handleDayChanged,
              onSubTypeSelected: this._handleSubTypeSelected,
            ),
            InputCell(onSubmit: _onSubmit)
          ],
        ),
      )
    );
  }
}