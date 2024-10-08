import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:student_lecture_app/core/injection/injection.config.dart';

final GetIt getIt = GetIt.instance;

@injectableInit
void configureInjection() {
  getIt.init();
  // getIt.registerFactory(() => MostPopularArticleCubit(getIt()));
}
