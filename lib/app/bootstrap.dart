import 'dart:async';
import 'dart:developer';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:crypto_assessment/app/app.dart';
import 'package:crypto_assessment/base/presentation/utils/logging/app_bloc_observer.dart';

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      final app = App();
      await app.initSdks();
      Bloc.observer = AppBlocObserver();
      runApp(await builder());
    },
    (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
    },
  );
}
