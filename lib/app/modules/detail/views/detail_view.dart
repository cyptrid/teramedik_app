// ignore_for_file: deprecated_member_use, unused_import, prefer_const_constructors, unused_local_variable, sized_box_for_whitespace

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../data/widgets.dart';
import '../controllers/detail_controller.dart';

class DetailView extends GetView<DetailController> {
  const DetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double bodyWdith = MediaQuery.of(context).size.width;
    double bodyHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: controller.obx(
        (state) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: bodyWdith,
                  height: bodyHeight * 0.4,
                  alignment: Alignment.topLeft,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        state['image'],
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  padding: EdgeInsets.only(top: 30),
                ),
                Container(
                  height: bodyHeight * 0.1,
                  width: bodyWdith,
                  padding: EdgeInsets.all(20),
                  color: Colors.blue.shade100,
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: bodyWdith * 0.02),
                        child: IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: Icon(
                            Icons.arrow_back,
                            size: 30,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            state['name'],
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          Text(state['city']),
                        ],
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                      height: bodyHeight * 0.02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        LauncherButton(Icons.call, () async {
                          await call(state['phoneNumber']);
                        }),
                        Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.blue.shade50,
                          ),
                          child: IconButton(
                            onPressed: () async {
                              String strLat = state['lat'];
                              String strlong = state['lng'];

                              double cnvStrLat = double.parse(strLat);
                              double cnvStrLong = double.parse(strlong);

                              final availableMaps =
                                  await MapLauncher.installedMaps;
                              await MapLauncher.showMarker(
                                mapType: MapType.google,
                                coords: Coords(cnvStrLat, cnvStrLong),
                                title: state['name'],
                              );
                            },
                            icon: Icon(
                              Icons.explore,
                            ),
                          ),
                        ),
                        LauncherButton(Icons.email, () async {
                          await sendEmail(state['email']);
                        }),
                      ],
                    ),
                    SizedBox(
                      height: bodyHeight * 0.02,
                    ),
                    Container(
                      width: bodyWdith * 0.8,
                      child: mainText(context, state['description']),
                    )
                  ],
                ),
              ],
            ),
          );
        },
        onLoading: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
