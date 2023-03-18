// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_login_sharedpref/helpers/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter_login_sharedpref/core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool? cekLogin = prefs.getBool(ConstantHelper.checkLogin);
  runApp(MyApp(isLogin: cekLogin));
}

class MyApp extends StatelessWidget {
  final bool? isLogin;
  const MyApp({
    super.key,
    required this.isLogin,
  });
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: Get.navigatorKey,
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: isLogin == true ? const HomeView() : const LoginView(),
    );
  }
}
