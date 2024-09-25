import 'package:flutter_e_store/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final isAppLoadingProvider = StateProvider<bool>((ref) {
  return false;
});

final newAppStore = Provider<AppStore>((ref) {
  return AppStore(ref);
});

class AppStore {
  Ref ref;
  AppStore(this.ref);

  static setAppBussy() {
    container.read(isAppLoadingProvider.notifier).state = true;
  }

  static setAppIdle() {
    container.read(isAppLoadingProvider.notifier).state = false;
  }
}
