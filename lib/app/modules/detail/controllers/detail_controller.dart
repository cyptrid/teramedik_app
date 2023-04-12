import 'package:get/get.dart';

import '../../../data/service.dart';

class DetailController extends GetxController with StateMixin<dynamic> {
  int args = Get.arguments;

  @override
  void onInit() {
    getDataById();
    super.onInit();
  }

  void getDataById() {
    try {
      HostProvider().getDataById(args).then((response) {
        if (response.statusCode == 200) {
          final data = response.body['data'];

          change(
            data,
            status: RxStatus.success(),
          );
        }
      }, onError: (_) {
        change(
          null,
          status: RxStatus.error(
            "Tidak dapat data dari API",
          ),
        );
      });
    } catch (err) {
      change(
        null,
        status: RxStatus.error(
          err.toString(),
        ),
      );
    }
  }
}
