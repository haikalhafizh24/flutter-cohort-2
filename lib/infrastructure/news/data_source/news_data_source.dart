// ignore_for_file: avoid_print

import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:student_lecture_app/core/commons/api_path_constant.dart';
import 'package:student_lecture_app/infrastructure/common/dtos/article_model.dart';
import 'package:student_lecture_app/infrastructure/core/api_helper.dart';

@injectable
class NewsDataSource {
  final ApiHelper _apiHelper;

  NewsDataSource(this._apiHelper);
  var logger = Logger();

  // ignore: duplicate_ignore
  Future<List<ArticleModel>> getTopStories(String section) async {
    final response =
        await _apiHelper.get(path: ApiPathConstant.topStories(section));
    final rawList = response.data as List;
    // print(rawList);
    return List.generate(
        rawList.length.clamp(0, 20), (i) => ArticleModel.fromJson(rawList[i]));
  }

  Future<List<ArticleModel>> getMostPopular() async {
    try {
      final response = await _apiHelper.get(path: ApiPathConstant.mostPopular);
      print('Raw API Response: ${response.data}');

      if (response.data is! List) {
        throw Exception('Unexpected response format: expected a List');
      }

      final rawList = response.data as List;
      return rawList
          .map((item) {
            if (item is! Map<String, dynamic>) {
              print('Item is not a Map: $item');
              return null;
            }
            print('Processing item: $item');
            return ArticleModel.fromMostPopular(item);
          })
          .whereType<ArticleModel>()
          .toList();
    } catch (e, stackTrace) {
      print('Error in getMostPopular: $e');
      print('Stack trace: $stackTrace');
      rethrow;
    }
  }
}
