import 'package:flutter/material.dart';

class TabInfo {
  final IconData icon;
  final String label;

  const TabInfo({
    required this.icon,
    required this.label,
  });
}

const TABS = [
  TabInfo(
    icon: Icons.account_balance_outlined,
    label: '지갑',
  ),
  TabInfo(
    icon: Icons.alarm_add_outlined,
    label: '알람',
  ),
  TabInfo(
    icon: Icons.keyboard,
    label: '키보드',
  ),
  TabInfo(
    icon: Icons.ac_unit,
    label: '온도',
  ),
  TabInfo(
    icon: Icons.adb,
    label: '안드로이드',
  ),
];
