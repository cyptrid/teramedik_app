import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double bodyHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Teramedik'),
        centerTitle: true,
        actions: [
          controller.obx(
            (_) => (controller.view.isTrue)
                ? IconButton(
                    onPressed: () {
                      controller.view.value = !controller.view.value;
                      controller.update();
                    },
                    icon: const Icon(Icons.sort))
                : IconButton(
                    onPressed: () {
                      controller.view.value = !controller.view.value;
                      controller.update();
                    },
                    icon: const Icon(Icons.grid_view),
                  ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
        child: controller.obx(
          (datas) => (controller.view.isTrue)
              ? ListView.builder(
                  itemCount: datas?.length,
                  itemBuilder: (context, index) {
                    final data = datas![index];
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed('/detail', arguments: data['id']);
                      },
                      child: Container(
                        height: bodyHeight * 0.3,
                        margin: const EdgeInsets.only(bottom: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey,
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromARGB(64, 0, 0, 0),
                              blurRadius: 8,
                              offset: Offset(0, 5),
                            ),
                          ],
                          image: DecorationImage(
                            image: NetworkImage(data['image']),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            gradient: const LinearGradient(
                              colors: [
                                Colors.black,
                                Colors.transparent,
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              stops: [0.2, 0.6],
                            ),
                          ),
                          alignment: Alignment.bottomLeft,
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data['name'],
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                data['city'],
                                style: TextStyle(
                                  color: Colors.grey.shade200,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                )
              : GridView.builder(
                  itemCount: datas!.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 20,
                    childAspectRatio: 4 / 6,
                  ),
                  itemBuilder: (context, index) {
                    final data = datas[index];
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed('/detail', arguments: data['id']);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey,
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromARGB(64, 0, 0, 0),
                              blurRadius: 8,
                              offset: Offset(0, 5),
                            ),
                          ],
                          image: DecorationImage(
                            image: NetworkImage(data['image']),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            gradient: const LinearGradient(
                              colors: [
                                Colors.black,
                                Colors.transparent,
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              stops: [0.2, 0.6],
                            ),
                          ),
                          alignment: Alignment.bottomLeft,
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data['name'],
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                data['city'],
                                style: TextStyle(
                                  color: Colors.grey.shade200,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }
}
