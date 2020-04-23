import 'package:flutter/material.dart';
import '../utils/constants.dart' show costIconMapping, incomeIconMapping;

class TypeSelectCell extends StatelessWidget {
  final bool isCost;
  final DateTime currentDay;
  final int selectedSubType;
  final onDayChanged;
  final onSubTypeSelected;
  
  TypeSelectCell({
    Key key ,
    this.isCost,
    this.currentDay,
    this.selectedSubType,
    this.onDayChanged,
    this.onSubTypeSelected,
  }):super(key:key);

  _renderTypeIcons(){
    var data = this.isCost ? costIconMapping : incomeIconMapping;
    List<Widget> list = [];
    data.forEach((key, value) {
      list.add(
        Container(
          child: Column(
            children: [
              SizedBox(
                width: 36,
                height: 36,
                child: FlatButton(
                  padding: EdgeInsets.symmetric(horizontal: 0),
                  onPressed: () {
                    _handleIconSelected(key);
                  },
                  color: key == this.selectedSubType ? Colors.orange : Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(18))
                  ),
                  child: Icon(value['icon'], size: 20,),
                ),
              ),
              Text(value['name']),
            ]
          ),
        )
      );
    });
    
    return list;
  }

  void _handleIconSelected(int index) {
    this.onSubTypeSelected(index);
  }

  @override
  Widget build(BuildContext context) {  
    return Expanded(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    FlatButton(
                      shape: Border.all(
                        color: Colors.grey,
                        width: 1.0,
                        style: BorderStyle.solid
                      ),
                      onPressed: (){
                        showDatePicker(
                          context: context,
                          initialDate: this.currentDay,
                          firstDate: this.currentDay.subtract(Duration(days: 365)),
                          lastDate: DateTime.now(),
                        ).then((DateTime selectedDateTime) {
                          if(selectedDateTime != null) {
                            this.onDayChanged(selectedDateTime);
                          }
                        });
                      },
                      child: Text('${this.currentDay.month}月${this.currentDay.day}日'),
                    ),
                    // Container(
                    //   width: 100.0,
                    //   height: 40.0,
                    //   margin: const EdgeInsets.only(right: 10.0),
                    //   decoration: BoxDecoration(
                    //     border: Border.all(width: 1, color: Color(0xFFE1E1E6))
                    //   ),
                    //   child: Center(
                    //     child: Text('增加备注1'),
                    //   )
                    // )
                  ]
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white
                ),
                height: 230.0,
                child: GridView.count(
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 20.0,
                  padding: EdgeInsets.all(10),
                  crossAxisCount: 5,
                  childAspectRatio: 1.0,
                  children: _renderTypeIcons(),
                ),
              )
            ]
          ),
        );
  }
}