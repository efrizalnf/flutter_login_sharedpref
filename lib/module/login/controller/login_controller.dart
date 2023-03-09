import 'package:flutter/material.dart';
import 'package:flutter_login_sharedpref/core.dart';
import 'package:flutter_login_sharedpref/helpers/constant.dart';
import 'package:flutter_login_sharedpref/helpers/prefs_data.dart';

class LoginController extends State<LoginView> implements MvcController {
  static late LoginController instance;
  String? username;
  String? password;
  late LoginView view;
  TextEditingController controllerFormUsername = TextEditingController();
  TextEditingController controllerFormPassword = TextEditingController();

  void doLogin() {
    var userData = {
      'username': username,
      'password': password,
    };
    PrefsData.inputPref(ConstantHelper.keyLogin, userData);
    Get.offAll(const HomeView());
  }

  void checkLogin() {
    var data = PrefsData.getPref(ConstantHelper.keyLogin);
    if (data == null) {
      Get.to(const LoginView());
    } else {
      Get.to(const DashboardView());
    }
  }

  @override
  void initState() {
    instance = this;
    // checkLogin();
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
