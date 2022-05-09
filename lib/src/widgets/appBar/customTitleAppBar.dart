import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:needbox_customer/src/widgets/button/customBackButton.dart';

import '../textWidget/kText.dart';

customTitleAppBar({
  required String title,
  Color? color,
  void Function()? onTap,
  IconData? icons,
}) =>
    AppBar(
      leading: IconButton(
        onPressed: onTap,
        icon: Icon(
          icons != null ? icons : Ionicons.menu,
        ),
      ),
      title: KText(
        text: '$title',
        fontSize: 17,
        color: color,
        fontWeight: FontWeight.w600,
      ),
    );
customTitleAppBarWithAction({
  required String title,
  Color? color,
  void Function()? onTap,
  IconData? icons,
  List<Widget>? actions,
}) =>
    AppBar(
      leading: IconButton(
        onPressed: onTap,
        icon: Icon(
          icons != null ? icons : Ionicons.menu,
        ),
      ),
      title: KText(
        text: '$title',
        fontSize: 17,
        color: color,
        fontWeight: FontWeight.w600,
      ),
      actions: actions,
    );
backAndTitleAppBar({
  required String title,
  Color? color,
  void Function()? onTap,
  IconData? icons,
}) =>
    AppBar(
      leading: customBackButton(),
      title: KText(
        text: '$title',
        fontSize: 17,
        color: color,
        fontWeight: FontWeight.w600,
      ),
    );
