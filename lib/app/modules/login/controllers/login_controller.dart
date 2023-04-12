import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teramedik/app/data/service.dart';

class LoginController extends GetxController {
  var userC = TextEditingController().obs;
  var passC = TextEditingController().obs;

  void dialogError(String msg) {
    Get.defaultDialog(title: "Terjadi Kesalahan", middleText: msg);
  }

  void dialogSuccess(String msg) {
    Get.defaultDialog(title: "Berhasil Masuk", middleText: msg);
  }

  void login(String name, String pass) {
    if (userC.value.text != "" || passC.value.text != "") {
      if (userC.value.text == "hospital" || passC.value.text == "password") {
        HostProvider().userLogin(name, pass);
        dialogSuccess("Welcome");
        Get.offAllNamed('/home');
      } else {
        dialogError("Username atau Password salah");
      }
    } else {
      dialogError("Isi Semua Input");
    }
  }
}
