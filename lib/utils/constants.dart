import 'package:flutter/material.dart';

final String appName = '记账本';

final List<String> tabs = ['明细','类别报表'];

final List<String> weekMapping = ['一', '二', '三', '四', '五', '六', '日'];

final costIconMapping = {
  0: {
    'icon': Icons.attach_money,
    'name': '一般',
    'color': 0xff66CCCC,
  },
  1: {
    'icon': Icons.fastfood,
    'name': '餐饮',
    'color': 0xff336633,
  },
  2: {
    'icon': Icons.shop,
    'name': '服装',
    'color': 0xff336699,
  },
  3: {
    'icon': Icons.traffic,
    'name': '交通',
    'color': 0xff6699FF,
  },
  4: {
    'icon': Icons.music_note,
    'name': '娱乐',
    'color': 0xff99CCFF,
  },
  5: {
    'icon': Icons.people_outline,
    'name': '社交',
    'color': 0xffCCCC33,
  },
  6: {
    'icon': Icons.home,
    'name': '居家',
    'color': 0xff99CC33,
  },
  7: {
    'icon': Icons.school,
    'name': '教育',
    'color': 0xff3399CC,
  },
  8: {
    'icon': Icons.nature_people,
    'name': '旅行',
    'color': 0xffCC9966,
  },
  9: {
    'icon': Icons.local_hospital,
    'name': '医疗',
    'color': 0xff660033,
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

final String noResult = '本月暂无纪录';
final String noMore = '就这么多哦, 下面没有了';
final String outOfRange = '别点了, 你没这么多钱 =.=#';
final String invalidNum = '请输入有效的金额';
final String noTypeResult = '暂时没有类别详情';

final int appBgColor = 0xff353553;
final int tabBarBgColor = 0xFF808392;