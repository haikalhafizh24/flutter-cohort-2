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

    print('Raw API Response: ${response.data}'); // Log the entire response
    final rawList = response.data as List;
    // print(rawList);
    return List.generate(
        rawList.length.clamp(0, 20), (i) => ArticleModel.fromJson(rawList[i]));
  }

  Future<List<ArticleModel>> getMostPopular() async {
    try {
      final response = await _apiHelper.get(path: ApiPathConstant.mostPopular);
      print('Raw API Response: ${response.data}'); // Log the entire response

      final rawList = response.data as List?;
      if (rawList == null) {
        print('Results list is null');
        return [];
      }

      return rawList.map((item) {
        print('Processing item: $item'); // Log each item
        return ArticleModel.fromMostPopular(item as Map<String, dynamic>);
      }).toList();
    } catch (e, stackTrace) {
      print('Error in getMostPopular: $e');
      print('Stack trace: $stackTrace');
      rethrow;
    }
  }

//   Future<List<ArticleModel>> getMostPopular() async {
//     final response = await _apiHelper.get(path: ApiPathConstant.mostPopular);
//     // ignore: avoid_print
//     print('Raw API Response: ${response.data}');  // Log the entire response
//     final rawList = response.data as List;
//     // ignore: avoid_print
//     logger.d(response);
//     // print('ini responsenya $response');
//     return List.generate(
//         rawList.length.clamp(0, 20), (i) => ArticleModel.fromJson(rawList[i]));
//   }
// }
}
