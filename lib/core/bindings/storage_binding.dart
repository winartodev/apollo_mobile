import 'package:apollo_mobile/core/bindings/async_bindings.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageBinding implements AsyncBindings {
  @override
  Future<void> asyncDependencies() async {
    final prefs = await SharedPreferences.getInstance();
    Get.putAsync<SharedPreferences>(() async => prefs, permanent: true);
  }

  @override
  void dependencies() {
    throw UnimplementedError('Use asyncDependencies instead');
  }
}
