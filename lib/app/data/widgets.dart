// ignore_for_file: must_be_immutable, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LauncherButton extends StatelessWidget {
  final IconData icon;

  late Function onTap;

  LauncherButton(this.icon, this.onTap, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.blue.shade50,
      ),
      child: IconButton(
        onPressed: () => onTap(),
        icon: Icon(icon),
      ),
    );
  }
}

Future<void> call(String phoneNumber) async {
  await launch("tel:$phoneNumber");
}

Future<void> sendEmail(String email) async {
  await launch("mailto:$email");
}

Widget mainText(BuildContext context, String str) {
  var newtext = str.replaceAll("xx", "\n");
  return Text(newtext);
}
