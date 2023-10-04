import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_login_sharedpref/core.dart';
import '../controller/dashboard_controller.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

  Widget build(context, DashboardController controller) {
    controller.view = this;

    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(0.0),
        child: Column(
          children: [
            ClipPath(
              clipper: OvalBottomBorderClipper(),
              child: Container(
                height: 300,
                color: Colors.green[400],
                child: SafeArea(
                  child: Container(
                    padding: const EdgeInsets.only(left: 25.0, top: 20.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Selamat datang, ",
                              style: TextStyle(
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                controller.username,
                                style: const TextStyle(
                                  fontSize: 24.0,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              transform: Matrix4.translationValues(0.0, -140, 0.0),
              padding: const EdgeInsets.only(left: 25.0, top: 15.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 150.0,
                    child: ListView.builder(
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        var item = {};
                        bool selected = index == 0;
                        return Container(
                          margin: const EdgeInsets.only(right: 12.0),
                          width: MediaQuery.of(context).size.width * 0.7,
                          height: MediaQuery.of(context).size.height * 0.3,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                "https://img.freepik.com/free-photo/pieces-chicken-fillet-with-mushrooms-stewed-tomato-sauce-with-boiled-broccoli-rice-proper-nutrition-healthy-lifestyle-dietetic-menu-top-view_2829-20015.jpg",
                              ),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                16.0,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  State<DashboardView> createState() => DashboardController();
}
