import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../theme/color.dart';
import '../utils/data.dart';
import '../widgets/category_item.dart';
import '../widgets/custom_round_textbox.dart';
import '../widgets/icon_box.dart';
import '../widgets/recipe_item.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  int selectedCategoryIndex = 0;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          backgroundColor: appBgColor,
          pinned: true,
          snap: true,
          floating: true,
          title: _buildHeader(),
        ),
        SliverToBoxAdapter(child: _buildSearch()),
        SliverToBoxAdapter(child: _buildCategory()),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => RecipeItem(
              data: recipes[index],
              onFavoriteTap: () {
                setState(() {
                  recipes[index]["is_favorited"] =
                      !recipes[index]["is_favorited"];
                });
              },
              onTap: () {},
            ),
            childCount: recipes.length,
          ),
        ),
      ],
    );
  }

  Widget _buildHeader() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Explore",
          style: TextStyle(
            fontSize: 28,
            color: Colors.black87,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget _buildSearch() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 10, 15, 15),
      child: Row(
        children: [
          const Expanded(
            child: CustomRoundTextBox(
              hint: "Search",
              prefix: Icon(Icons.search, color: Colors.grey),
            ),
          ),
          const SizedBox(width: 10),
          IconBox(
            radius: 50,
            padding: 8,
            child: SvgPicture.asset(
              "assets/icons/filter1.svg",
              // ignore: prefer_const_constructors
              colorFilter: ColorFilter.mode(darker, BlendMode.srcIn),
              width: 18,
              height: 18,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategory() {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(15, 5, 7, 20),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          categories.length,
          (index) => Padding(
            padding: const EdgeInsets.only(right: 8),
            child: CategoryItem(
              padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
              data: categories[index],
              isSelected: index == selectedCategoryIndex,
              onTap: () {
                setState(() {
                  selectedCategoryIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
