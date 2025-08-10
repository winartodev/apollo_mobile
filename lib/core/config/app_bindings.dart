import 'package:apollo_mobile/core/bindings/api_client_binding.dart';
import 'package:apollo_mobile/core/bindings/async_bindings.dart';
import 'package:apollo_mobile/core/bindings/storage_binding.dart';
import 'package:apollo_mobile/features/auth/auth_binding.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class AppBindings {
  static final List<Bindings> _coreBindings = <Bindings>[
    StorageBinding(),
    ApiClientBinding(),
  ];

  static final List<Bindings> _featureBindings = <Bindings>[AuthBinding()];

  static Future<void> initialize() async {
    try {
      // Initialize core bindings first (sequential for critical dependencies)
      for (final binding in _coreBindings) {
        if (binding is AsyncBindings) {
          await binding.asyncDependencies();
        } else {
          binding.dependencies();
        }
      }

      // Initialize feature bindings (can be parallel)
      await Future.wait(
        _featureBindings.map((binding) async {
          if (binding is AsyncBindings) {
            await binding.asyncDependencies();
          } else {
            binding.dependencies();
          }
        }),
      );
    } catch (e, stackTrace) {
      debugPrint('Binding initialization failed $e $stackTrace');
      rethrow;
    }
  }
}
