import 'package:flutter/material.dart';
import 'package:madura_shop/screen/basketpage.dart';
import 'package:madura_shop/screen/favoritepage.dart';
import 'package:madura_shop/screen/homepage.dart';
import 'package:madura_shop/screen/profilepage.dart';
import 'package:madura_shop/screen/searchpage.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class NavigationHomepage extends StatefulWidget {
  const NavigationHomepage({super.key});

  @override
  State<NavigationHomepage> createState() => _NavigationHomepageState();
}

class _NavigationHomepageState extends State<NavigationHomepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Colors.white,
        body: PersistentTabView(
      context,
      screens: screens(),
      items: navbarItems(),
      navBarStyle: NavBarStyle.style12,
    ));
  }
}

List<Widget> screens() {
  return [
    Homepage(),
    Searchpage(),
    Basketpage(),
    Favoritepage(),
    Profilepage(),
  ];
}

List<PersistentBottomNavBarItem> navbarItems() {
  return [
    PersistentBottomNavBarItem(
        icon: Icon(Icons.home),
        title: '.',
        activeColorSecondary: Colors.black,
        activeColorPrimary: Colors.grey),
    PersistentBottomNavBarItem(
        icon: Icon(Icons.search),
        title: '.',
        activeColorSecondary: Colors.black,
        activeColorPrimary: Colors.grey),
    PersistentBottomNavBarItem(
        icon: Icon(Icons.shopping_basket),
        title: '.',
        activeColorSecondary: Colors.black,
        activeColorPrimary: Colors.grey),
    PersistentBottomNavBarItem(
        icon: Icon(Icons.favorite),
        title: '.',
        activeColorSecondary: Colors.black,
        activeColorPrimary: Colors.grey),
    PersistentBottomNavBarItem(
        icon: Icon(Icons.person),
        title: '.',
        activeColorSecondary: Colors.black,
        activeColorPrimary: Colors.grey),
  ];
}
