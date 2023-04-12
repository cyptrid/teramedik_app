import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double bodyHeight = MediaQuery.of(context).size.height;
    double bodyWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: bodyHeight * 0.2,
            width: bodyWidth,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'https://teramedik.com/product/teramedikCE/images/home_assets/tentang-logo.png'),
              ),
            ),
          ),
          const Text(
            "SIGN IN",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Obx(
              () => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    controller: controller.userC.value,
                    decoration: const InputDecoration(
                      labelText: "Username",
                      hintText: "Username",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: bodyHeight * 0.02,
                  ),
                  TextField(
                    controller: controller.passC.value,
                    decoration: const InputDecoration(
                      labelText: "Password",
                      hintText: "Password",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: bodyHeight * 0.02,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      controller.login(controller.userC.value.text,
                          controller.passC.value.text);
                    },
                    child: const Text("Login"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
