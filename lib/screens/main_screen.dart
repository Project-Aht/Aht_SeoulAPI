import 'package:aht_dimigo/screens/menu_screen.dart';
import 'package:aht_dimigo/themes/color_theme.dart';
import 'package:flutter/material.dart';
import 'package:aht_dimigo/screens/home_screen.dart';
import 'package:aht_dimigo/screens/calendar_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

/*void navigateToInitPINScreen() {
  Get.to(() => const InitPINScreen());
}*/

/*void navigateToChangePINScreen() {
  Get.to(() => const ChangePINScreen());
}*/

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  late final TabController _tabController = TabController(
    length: 3,
    vsync: this,
    initialIndex: 0,

    /// 탭 변경 애니메이션 시간
    animationDuration: const Duration(milliseconds: 600), //에니메이션 시간
  );

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    double screenHeight = MediaQuery.of(context).size.height;
    // ignore: unused_local_variable
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Color(0xFFB0B0B0),
        ),
        child: TabBarView(
          controller: _tabController,
          children: const [
            CalendarScreen(),
            HomeScreen(),
            MenuScreen(),
          ],
        ),
      ),
      extendBodyBehindAppBar: true,
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Color(0xFFB0B0B0),
              width: 0.15,
            ),
          ),
        ),
        height: screenHeight / 844 * 70,
        child: Padding(
          padding: EdgeInsets.only(
              left: screenWidth / 390 * 0,
              right: screenWidth / 390 * 0,
              top: screenHeight / 844 * 2),
          child: TabBar(
            controller: _tabController,
            tabs: [
              Tab(
                icon: Icon(
                  Icons.calendar_month_outlined,
                  size: screenWidth / 390 * 26,
                ),
                text: '캘린더',
                iconMargin: EdgeInsets.only(bottom: screenHeight / 844 * 6.5),
              ),
              Tab(
                icon: Icon(
                  Icons.home,
                  size: screenWidth / 390 * 26,
                ),
                text: '홈',
                iconMargin: EdgeInsets.only(bottom: screenHeight / 844 * 6.5),
              ),
              Tab(
                icon: Icon(
                  Icons.menu,
                  size: screenWidth / 390 * 26,
                ),
                text: '메뉴',
                iconMargin: EdgeInsets.only(bottom: screenHeight / 844 * 6.5),
              ),
            ],
            indicatorSize: TabBarIndicatorSize.label,
            indicatorColor: AhtColors.Main_Color,
            indicatorWeight: 1,
            labelColor: AhtColors.Main_Color,
            unselectedLabelColor: const Color(0xFFB0B0B0),
          ),
        ),
      ),
    );
  }
}
