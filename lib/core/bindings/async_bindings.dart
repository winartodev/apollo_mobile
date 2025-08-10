import 'package:get/get_instance/src/bindings_interface.dart';

abstract class AsyncBindings implements Bindings {
  Future<void> asyncDependencies();
}
