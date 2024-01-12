import 'package:flutter/material.dart';

class CustomTabbarWidget extends StatelessWidget {
  final bool isScrollable;
  final List<String> tabs;
  const CustomTabbarWidget({
    super.key,
    this.isScrollable = true,
    required this.tabs,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36,
      child: TabBar(
        isScrollable: isScrollable,
        padding: EdgeInsets.zero,
        physics: const BouncingScrollPhysics(),
        labelPadding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        indicatorPadding: EdgeInsets.zero,
        indicatorSize: TabBarIndicatorSize.tab,
        dividerColor: Colors.transparent,
        tabAlignment: isScrollable ? TabAlignment.start : null,
        tabs: tabs.map((e) => Tab(text: e)).toList(),
      ),
    );
  }
}
