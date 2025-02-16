import 'package:get_it/get_it.dart';
import 'package:wotd/repository/word_repository.dart';
import 'package:wotd/service/api_service.dart';

final serviceLocator = GetIt.instance;
Future<void> locatorSetUp() async {
  serviceLocator.registerLazySingleton<IApiService>(() => ApiService());
  serviceLocator.registerLazySingleton<IWordRepository>(
      () => WordRepository(apiService: serviceLocator<IApiService>()));
}
