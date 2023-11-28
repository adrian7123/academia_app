import 'package:academia_app/app/store/global_store.dart';
import 'package:academia_app/app/pages/splash/splash_page.dart';
import 'package:academia_app/app/shared/api.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton(Api.new);
    i.addLazySingleton(GlobalStore.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const SplashPage());
  }
}
