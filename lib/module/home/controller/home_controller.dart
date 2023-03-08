import 'package:flutter/material.dart';
import 'package:flutter_login_sharedpref/state_util.dart';
import '../../dashboard/view/dashboard_view.dart';
import '../view/home_view.dart';

class HomeController extends State<HomeView> implements MvcController {
  static late HomeController instance;
  late HomeView view;
  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  final List<Widget> list = [
    const DashboardView(),
    Container(
      padding: const EdgeInsets.all(0.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Cart',
              style: TextStyle(fontSize: 19.0),
            ),
          ],
        ),
      ),
    ),
    Container(
      padding: const EdgeInsets.all(0.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Favourite',
              style: TextStyle(fontSize: 19.0),
            ),
          ],
        ),
      ),
    ),
    Container(
      padding: const EdgeInsets.all(0.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Profile',
              style: TextStyle(fontSize: 19.0),
            ),
          ],
        ),
      ),
    ),
  ];

  int selectedIndex = 0;
  List<dynamic> menuItems = [
    {
      'icon': 'assets/icons/home_.svg',
      'label': 'Home',
    },
    {
      'icon': 'assets/icons/cart_.svg',
      'label': 'Cart',
    },
    {
      'icon': 'assets/icons/favorite.svg',
      'label': 'Favorite',
    },
    {
      'icon': 'assets/icons/profile_.svg',
      'label': 'Profile',
    },
  ];

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
