import 'package:flutter/material.dart';
import '../theme/color.dart';
import '../widgets/favorite_box.dart'; // ✅ ensure FavoriteBox is imported

class PopularItem extends StatelessWidget {
  const PopularItem({
    super.key,
    required this.data,
    this.onTap,
    this.onFavoriteTap,
  });

  final Map data;
  final GestureTapCallback? onTap;
  final GestureTapCallback? onFavoriteTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: shadowColor.withValues(alpha: 0.1),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Stack(
          children: [
            // your image or content here...
            Positioned(
              right: 10,
              top: 10,
              child: FavoriteBox(
                isFavorited: data["is_favorited"] ?? false,
                onTap: onFavoriteTap,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
