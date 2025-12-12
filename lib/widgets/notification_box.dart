import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:badges/badges.dart' as badges;

import '../theme/color.dart';

class NotificationBox extends StatelessWidget {
  const NotificationBox({
    super.key,
    this.onTap,
    this.size = 6,
    this.notifiedNumber = 0,
  });

  final GestureTapCallback? onTap;
  final int notifiedNumber;
  final double size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(size),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: appBarColor,
          border: Border.all(color: shadowColor.withValues(alpha: 0.3)),
        ),
        child: notifiedNumber > 0
            ? badges.Badge(
                badgeColor: red, // ✅ v2.x API
                padding: const EdgeInsets.all(3),
                position: badges.BadgePosition.topEnd(top: -7, end: 0),
                badgeContent: const Text(
                  '',
                  style: TextStyle(color: Colors.white),
                ),
                child: SvgPicture.asset(
                  "assets/icons/bell.svg",
                  width: 20,
                  height: 20,
                ),
              )
            : SvgPicture.asset("assets/icons/bell.svg"),
      ),
    );
  }
}
