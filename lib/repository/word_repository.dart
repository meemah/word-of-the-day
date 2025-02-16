import 'package:wotd/service/api_service.dart';

abstract class IWordRepository {
  Future getWordOfTheDay();
}

class WordRepository extends IWordRepository {
  final IApiService apiService;

  WordRepository({required this.apiService});
  @override
  Future getWordOfTheDay() async {
    await apiService.get("/random");
  }
}
