import 'package:flutter/material.dart';
import 'package:pod_i_ya/core/util/pixel_sizer.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:pod_i_ya/core/widgets/app_bars/base_app_bar.dart';
import 'package:pod_i_ya/features/main_page/presentation/main_page/main_page.dart';
import 'package:pod_i_ya/features/search_page/presentation/search_page/search_page.dart';
import 'package:pod_i_ya/features/subscriptions_page/presentation/subscriptions_page/subscriptions_page.dart';

class MainAppScreen extends StatefulWidget {
  const MainAppScreen({super.key});

  @override
  State<MainAppScreen> createState() => _MainAppScreenState();
}

class _MainAppScreenState extends State<MainAppScreen>
    with SingleTickerProviderStateMixin {
  var _pageIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _pageIndex = index;
    });
  }

  Color iconBack(int page) {
    if (_pageIndex == page) {
      return const Color(0xff967595);
    } else {
      return const Color(0xff15071E);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(),
      drawer: const MainAppDrawer(),
      body: SafeArea(
        top: false,
        child: IndexedStack(
          index: _pageIndex,
          children: const <Widget>[
            SubscriptionPage(),
            MainPage(),
            SearchPage()
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xff15071E),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Container(
              decoration:
                  BoxDecoration(color: iconBack(0), shape: BoxShape.circle),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.add_alert,
                ),
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Container(
              decoration:
                  BoxDecoration(color: iconBack(1), shape: BoxShape.circle),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.home,
                ),
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Container(
              decoration:
                  BoxDecoration(color: iconBack(2), shape: BoxShape.circle),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.search,
                ),
              ),
            ),
            label: '',
          ),
        ],
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _pageIndex,
        unselectedIconTheme: const IconThemeData(
          color: Color(0xffCBCBCB),
        ),
        selectedIconTheme: const IconThemeData(
          color: Color(0xff4C334F),
        ),
        selectedItemColor: const Color(0xff4C334F),
        onTap: _onItemTapped,
      ),
    );
  }
}

class MainAppBar extends StatelessWidget implements PreferredSizeWidget{
  const MainAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BaseAppBar(leftWidget: Builder(builder: (BuildContext context) {
      return IconButton(
        icon: const Icon(Icons.accessible),
        onPressed: () => Scaffold.of(context).openDrawer(),
        tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
      );
    }));
  }

  @override
  Size get preferredSize => Size(100.w, 50.ph);
}

class MainAppDrawer extends StatelessWidget {
  const MainAppDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.grey,
      ),
    );
  }
}
