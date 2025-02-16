import 'package:wotd/model/words_of_day_response.dart';
import 'package:wotd/service/api_service.dart';

abstract class IWordRepository {
  Future<WordsOfDayListResponse> getWordOfTheDay();
}

class WordRepository extends IWordRepository {
  final IApiService apiService;

  WordRepository({required this.apiService});
  @override
  Future<WordsOfDayListResponse> getWordOfTheDay() async {
    var response = await apiService.get("/random");
    return WordsOfDayListResponse.fromJson(response);
  }
}
