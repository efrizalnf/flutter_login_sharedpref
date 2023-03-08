import 'package:flutter/material.dart';
import 'package:flutter_login_sharedpref/state_util.dart';
import '../../../helpers/constant.dart';
import '../../../helpers/prefs_data.dart';
import '../view/dashboard_view.dart';

class DashboardController extends State<DashboardView>
    implements MvcController {
  static late DashboardController instance;
  late DashboardView view;
  String username = '';

  void getDataUser() async {
    var data = await PrefsData.getPref(ConstantHelper.keyLogin);
    setState(() {
      username = data['username'];
    });
  }

  @override
  void initState() {
    instance = this;
    getDataUser();
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
