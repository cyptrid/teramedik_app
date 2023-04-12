import 'package:get/get.dart';
import 'package:teramedik/app/data/service.dart';

class HomeController extends GetxController with StateMixin<dynamic> {
  var view = true.obs;

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  void getData() {
    HostProvider().getData().then((value) {
      change(value, status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }
}
