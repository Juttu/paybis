import 'package:flutter/material.dart';
import 'package:payBISUI/screens/login.dart';
import 'package:payBISUI/screens/pay_page.dart';

import '../../../home/presentation/homepage.dart';

class NavigatorItem {
  final String label;
  final String iconPath;
  final int index;
  final Widget screen;

  NavigatorItem(this.label, this.iconPath, this.index, this.screen);
}

List<NavigatorItem> navigatorItems = [
  NavigatorItem("Shop", "assets/svg/icon_heart_colored.svg", 0, HomePage()),
  NavigatorItem("Shop", "assets/svg/icon_heart_colored.svg", 1, LoginPage()),
  NavigatorItem("Shop", "assets/svg/icon_heart_colored.svg", 2, HomePage()),
  NavigatorItem("Shop", "assets/svg/icon_heart_colored.svg", 3, Pay()),
  NavigatorItem("Shop", "assets/svg/icon_heart_colored.svg", 4, LoginPage()),

];
