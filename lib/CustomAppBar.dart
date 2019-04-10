import 'package:flutter/material.dart';
import 'main.dart';

class CustomAppBar extends StatelessWidget {
  final List<BottomNavigationBarItem> bottomBarItems = [];

  final bottomNavBarStyle = TextStyle(
    color: appTheme.primaryColor,
    fontStyle: FontStyle.normal,
  );

  CustomAppBar() {
    bottomBarItems.add(
      BottomNavigationBarItem(
        activeIcon: Icon(
          Icons.home,
          color: appTheme.primaryColor,
        ),
        icon: Icon(
          Icons.home,
          color: Colors.black,
        ),
        title: Text("Explore", style: bottomNavBarStyle),
      ),
    );
    bottomBarItems.add(
      BottomNavigationBarItem(
          icon: Icon(
            Icons.favorite,
            color: Colors.black,
          ),
          title: Text("Favorit", style: bottomNavBarStyle)),
    );
    bottomBarItems.add(
      BottomNavigationBarItem(
          icon: Icon(
            Icons.local_offer,
            color: Colors.black,
          ),
          title: Text("Transaksi", style: bottomNavBarStyle)),
    );
    bottomBarItems.add(
      BottomNavigationBarItem(
          icon: Icon(
            Icons.notifications,
            color: Colors.black,
          ),
          title: Text("Notifikasi", style: bottomNavBarStyle)),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 35,
      child: BottomNavigationBar(
        currentIndex: 1,
        items: bottomBarItems,
        type: BottomNavigationBarType.shifting,
      ),
    );
  }
}
