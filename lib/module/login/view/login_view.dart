import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_login_sharedpref/core.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  Widget build(context, LoginController controller) {
    controller.view = this;

    return Scaffold(
      body: SingleChildScrollView(
        controller: ScrollController(),
        child: Column(
          children: [
            Column(
              children: [
                ClipPath(
                  clipper: WaveClipperOne(reverse: false),
                  child: Container(
                    height: 320,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  transform: Matrix4.translationValues(0.0, -60, 0.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.network(
                        "https://i.ibb.co/rsz6JWq/751463.png",
                        width: 200.0,
                        height: 200.0,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          children: [
                            TextFormField(
                              controller: controller.controllerFormUsername,
                              maxLength: 20,
                              decoration: const InputDecoration(
                                labelText: 'Username',
                                labelStyle: TextStyle(
                                  color: Colors.blueGrey,
                                ),
                                suffixIcon: Icon(
                                  Icons.supervised_user_circle,
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.blueGrey,
                                  ),
                                ),
                                helperText: 'Enter your username',
                              ),
                              onChanged: (value) {
                                controller.username = value;
                              },
                            ),
                            TextFormField(
                              controller: controller.controllerFormPassword,
                              maxLength: 20,
                              obscureText: true,
                              decoration: const InputDecoration(
                                labelText: 'Password',
                                labelStyle: TextStyle(
                                  color: Colors.blueGrey,
                                ),
                                suffixIcon: Icon(
                                  Icons.password,
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.blueGrey,
                                  ),
                                ),
                                helperText: 'Enter your password',
                              ),
                              onChanged: (value) {
                                controller.password = value;
                              },
                            ),
                            const SizedBox(
                              height: 16.0,
                            ),
                            SizedBox(
                              width: 150.0,
                              height: 50.0,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(24.0),
                                  ),
                                ),
                                onPressed: () async {
                                  if (controller.username == null &&
                                      controller.password == null) {
                                    Get.offAll(const LoginView());
                                  } else {
                                    controller.saveLogin();
                                  }
                                },
                                child: const Text(
                                  "Login",
                                  style: TextStyle(
                                    fontSize: 18.0,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  State<LoginView> createState() => LoginController();
}
