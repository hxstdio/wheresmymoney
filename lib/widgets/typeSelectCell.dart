import 'package:flutter/material.dart';
import '../utils/constants.dart' show costIconMapping, incomeIconMapping;

class TypeSelectCell extends StatefulWidget {
  final bool isCost;
  
  TypeSelectCell({
    Key key ,
    this.isCost,
  }):super(key:key);

  @override
  _TypeSelectCell createState() => _TypeSelectCell();
}

class _TypeSelectCell  extends State<TypeSelectCell> {
  int selectedTypeIndex = 0;

  _renderTypeIcons(){
    var data = widget.isCost ? costIconMapping : incomeIconMapping;
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
                  color: key == this.selectedTypeIndex ? Colors.orange : Colors.white,
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
    print('selcted => $index');
    this.setState(() {
      this.selectedTypeIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {  
    var currentDateTime = DateTime.now();
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
                  Container(
                    width: 100.0,
                    height: 40.0,
                    margin: const EdgeInsets.only(right: 10.0),
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Color(0xFFE1E1E6))
                    ),
                    child: Center(
                      child: Text('${currentDateTime.month}月${currentDateTime.day}日'),
                    )
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
              Container(
                height: 230.0,
                margin: const EdgeInsets.only(top: 10.0),
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
        )
      ),
    );
  }
}