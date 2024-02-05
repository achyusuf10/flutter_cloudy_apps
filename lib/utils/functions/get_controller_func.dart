import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class GetControllerFunc {
  GetControllerFunc._();
  static S call<S extends BlocBase>({
    bool reset = false,
  }) {
    if (reset && GetIt.I.isRegistered<S>()) {
      GetIt.I.resetLazySingleton<S>();
    }
    return GetIt.I.get<S>();
  }
}
