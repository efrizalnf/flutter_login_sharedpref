import 'package:flutter/material.dart';
import 'package:flutter_login_sharedpref/core.dart';
import 'package:ionicons/ionicons.dart';
import '../controller/home_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  Widget build(context, HomeController controller) {
    controller.view = this;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              foregroundColor: Colors.black12,
              backgroundImage: NetworkImage(
                "https://i.ibb.co/PGv8ZzG/me.jpg",
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.location_pin,
                    size: 24.0,
                  ),
                  Text(
                    "Location",
                    style: TextStyle(),
                  ),
                  Icon(
                    Ionicons.chevron_down,
                    size: 24.0,
                  ),
                ],
              ),
            ),
            const Badge(
              alignment: AlignmentDirectional(24.0, 0.0),
              label: Text(
                "4",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              child: Icon(
                Icons.notifications,
                size: 40.0,
              ),
            ),
          ],
        ),
      ),
      body: controller.list[controller.selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        unselectedItemColor: Colors.black87,
        elevation: 32.0,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: const TextStyle(
          height: 1.5,
          fontSize: 12,
        ),
        unselectedLabelStyle: const TextStyle(
          height: 1.5,
          fontSize: 12,
        ),
        items: controller.menuItems.map((i) {
          return BottomNavigationBarItem(
            activeIcon: Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.all(Radius.circular(14)),
              ),
              child: SvgPicture.asset(
                i['icon'],
                color: Colors.white,
              ),
            ),
            icon: SvgPicture.asset(
              i['icon'],
              color: Colors.grey,
            ),
            label: i['label'],
          );
        }).toList(),
        currentIndex: controller.selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: controller.onItemTapped,
      ),
    );
  }

  @override
  State<HomeView> createState() => HomeController();
}
