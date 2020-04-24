import 'package:flutter/material.dart';

final String appName = '记账本';

final List<String> tabs = ['明细','类别报表'];

final List<String> weekMapping = ['一', '二', '三', '四', '五', '六', '日'];

final costIconMapping = {
  0: {
    'icon': Icons.attach_money,
    'name': '一般',
    'color': 0xffff0000,
  },
  1: {
    'icon': Icons.fastfood,
    'name': '餐饮',
    'color': 0xff0000ff,
  },
  2: {
    'icon': Icons.shop,
    'name': '服装',
    'color': 0xffff6600,
  },
  3: {
    'icon': Icons.traffic,
    'name': '交通',
    'color': 0xffff9900,
  },
  4: {
    'icon': Icons.music_note,
    'name': '娱乐',
    'color': 0xffff3300,
  },
  5: {
    'icon': Icons.people_outline,
    'name': '社交',
    'color': 0xff99ff00,
  },
  6: {
    'icon': Icons.home,
    'name': '居家',
    'color': 0xff00ff00,
  },
  7: {
    'icon': Icons.school,
    'name': '教育',
    'color': 0xff00ffff,
  },
  8: {
    'icon': Icons.nature_people,
    'name': '旅行',
    'color': 0xffffff00,
  },
  9: {
    'icon': Icons.local_hospital,
    'name': '医疗',
    'color': 0xff6600ff,
  },
};

final incomeIconMapping = {
  0: {
    'icon': Icons.tag_faces,
    'name': '工资',
    'color': 0xffff00ff,
  },
  1: {
    'icon': Icons.card_giftcard,
    'name': '礼金',
    'color': 0xffff0066,
  },
  2: {
    'icon': Icons.payment,
    'name': '其他',
    'color': 0xff000000,
  }
};

final int appBgColor = 0xff353553;
final int tabBarBgColor = 0xFF808392;