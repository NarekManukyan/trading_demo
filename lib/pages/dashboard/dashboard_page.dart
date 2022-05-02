import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../widgets/app_bar_widget.dart';
import '../../widgets/bottom_nav_bar_widget.dart';
import '../home_page/home_page.dart';

class DashboardPage extends HookWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: Stack(
          children: [
            PageView(
              children: const [
                HomePage(),
              ],
            ),
            const Align(
              alignment: Alignment.bottomCenter,
              child: BottomNavBarWidget(),
            ),
            const Align(
              alignment: Alignment.topCenter,
              child: AppBarWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
