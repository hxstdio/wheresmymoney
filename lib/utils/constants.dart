import 'package:flutter/material.dart';

final String appName = '记账本';

final List<String> tabs = ['明细','类别报表'];

final List<String> weekMapping = ['一', '二', '三', '四', '五', '六', '日'];

final costIconMapping = {
    0: {
      'icon': Icons.attach_money,
      'name': '一般'
    },
    1: {
      'icon': Icons.fastfood,
      'name': '餐饮'
    },
    2: {
      'icon': Icons.shop,
      'name': '服装'
    },
    3: {
      'icon': Icons.traffic,
      'name': '交通'
    },
    4: {
      'icon': Icons.music_note,
      'name': '娱乐'
    },
    5: {
      'icon': Icons.people_outline,
      'name': '社交'
    },
    6: {
      'icon': Icons.home,
      'name': '居家'
    },
    7: {
      'icon': Icons.school,
      'name': '教育'
    },
    8: {
      'icon': Icons.nature_people,
      'name': '旅行'
    },
    9: {
      'icon': Icons.local_hospital,
      'name': '医疗'
    },
  };

  final incomeIconMapping = {
    0: {
      'icon': Icons.tag_faces,
      'name': '工资'
    },
    1: {
      'icon': Icons.card_giftcard,
      'name': '礼金'
    },
    2: {
      'icon': Icons.payment,
      'name': '其他'
    }
  };

final int appBgColor = 0xff353553;
final int tabBarBgColor = 0xFF808392;