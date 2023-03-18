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

  void doLogin() async {
    var userData = {
      'username': username,
      'password': password,
      'isLogin': true
    };
    await PrefsData.setPref(ConstantHelper.keyLogin, userData);
    Get.offAll(const HomeView());
  }

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
