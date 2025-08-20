import 'package:apollo_mobile/core/helper.dart';
import 'package:apollo_mobile/core/network/api_client.dart';
import 'package:get/get.dart';

class ApiClientBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<ApiClient>(
      ApiClient(
        baseUrl: "http://192.168.3.223:8081/api",
        platfrom: Helper.getTargetPlatform(),
      ),
      permanent: true,
    );
  }
}
