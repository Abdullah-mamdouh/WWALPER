import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:wwalper_app/core/theming/colors.dart';
import 'package:wwalper_app/features/favorite/ui/favorite_screen.dart';
import 'package:wwalper_app/features/home/ui/home_screen.dart';
import 'package:wwalper_app/features/search/search_screen.dart';
import 'package:wwalper_app/features/setting/ui/setting_screen.dart';

class ManagerScreen extends StatefulWidget {
  const ManagerScreen({Key? key}) : super(key: key);

  @override
  _ManagerScreenState createState() => _ManagerScreenState();
}

class _ManagerScreenState extends State<ManagerScreen> {
  final List<Widget> _widgetOptions = [
    const HomeScreen(),
    const SearchScreen(),
    const FavoriteScreen(),
    const SettingScreen(),
  ];

  ShapeBorder bottomBarShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(25.r)),
  );

  SnakeBarBehaviour snakeBarStyle = SnakeBarBehaviour.floating;
  int _selectedItemPosition = 0;
  SnakeShape snakeShape = SnakeShape.indicator;
  bool showSelectedLabels = true;
  bool showUnselectedLabels = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: true,
      extendBody: true,
      bottomNavigationBar: SnakeNavigationBar.color(
        backgroundColor: ColorsManager.purpleColor,
        behaviour: snakeBarStyle,
        snakeShape: snakeShape,
        shape: bottomBarShape,
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.2,
          vertical: 20.h,
        ),
        snakeViewColor: Theme.of(context).highlightColor,
        selectedItemColor: snakeShape == SnakeShape.indicator
            ? Theme.of(context).cardColor
            : null,
        unselectedItemColor: Colors.black87,
        showUnselectedLabels: showUnselectedLabels,
        showSelectedLabels: showSelectedLabels,
        currentIndex: _selectedItemPosition,
        onTap: (index) => setState(() => _selectedItemPosition = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home)),
          BottomNavigationBarItem(icon: Icon(Icons.search_outlined)),
          BottomNavigationBarItem(icon: Icon(Icons.favorite)),
          BottomNavigationBarItem(icon: Icon(Icons.settings)),
        ],
        selectedLabelStyle: const TextStyle(fontSize: 12),
        unselectedLabelStyle: const TextStyle(fontSize: 8),
      ),
      body: IndexedStack(
        index: _selectedItemPosition,
        children: _widgetOptions,
      ),
    );
  }
}
