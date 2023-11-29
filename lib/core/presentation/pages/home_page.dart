import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../constant/colors.dart';
import '../../constant/lists.dart';

class HomePage extends StatefulWidget {
  final StatefulNavigationShell statefulNavigationShell;
  const HomePage({
    Key? key,
    required this.statefulNavigationShell,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.statefulNavigationShell,
      bottomNavigationBar: SafeArea(
        child: BottomNavigationBar(
          currentIndex: widget.statefulNavigationShell.currentIndex,
          items: Lists.bottomBarItemList,
          selectedItemColor: AppColors.purpleColor,
          unselectedItemColor: AppColors.mediumGrey,
          elevation: 10,
          onTap: (value) => goToBranch(value),
        ),
      ),
    );
  }

  void goToBranch(int index) {
    widget.statefulNavigationShell.goBranch(
      index,
      initialLocation: index == widget.statefulNavigationShell.currentIndex,
    );
  }
}
