import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:student_lecture_app/core/commons/constants.dart';

part 'article_model.freezed.dart';
part 'article_model.g.dart';

@freezed
class ArticleModel with _$ArticleModel {
  const ArticleModel._();
  factory ArticleModel({
    @JsonKey(name: 'short_url') required String id,
    required String title,
    required String byline,
    required List<String> multimedia,
    required String publishedDate,
  }) = _ArticleModel;

  factory ArticleModel.fromMostPopular(Map<String, dynamic> json) {
    // ignore: avoid_print
    print('Received JSON: $json');
    return ArticleModel(
      id: json['id'].toString(),
      title: json['title'] as String? ?? '',
      byline: json['byline'] as String? ?? '',
      multimedia: multimediaFromJson(json['media']),
      publishedDate: json['published_date'] as String? ?? '',
    );
  }

  factory ArticleModel.fromTopStories(Map<String, dynamic> json) {
    return ArticleModel(
      id: json['uri'] as String? ?? '',
      title: json['title'] as String? ?? '',
      byline: json['byline'] as String? ?? '',
      multimedia: multimediaFromTopStoriesJson(json['multimedia']),
      publishedDate: json['published_date'] as String? ?? '',
    );
  }

  String get publishedDateConverted {
    if (publishedDate.contains('T')) {
      return publishedDate.split('T')[0];
    }
    return publishedDate;
  }

  String get multimediaConverted {
    if (multimedia.isEmpty) {
      return Constants.dummyImg;
    }

    if (multimedia[0].contains('https://static01.nyt.com/')) {
      return multimedia[0];
    }

    return 'https://static01.nyt.com/${multimedia[0]}';
  }

  factory ArticleModel.fromJson(Map<String, dynamic> json) =>
      _$ArticleModelFromJson(json);
}

bool isListOfStrings(List<dynamic> list) {
  return list.every((element) => element is String);
}

List<String> multimediaFromTopStoriesJson(dynamic multimedia) {
  if (multimedia == null || multimedia is! List || multimedia.isEmpty) {
    return [];
  }

  return multimedia
      .where((item) => item is Map<String, dynamic> && item['url'] != null)
      .map((item) => item['url'] as String)
      .toList();
}

List<String> multimediaFromJson(dynamic media) {
  if (media == null || media is! List || media.isEmpty) {
    return [];
  }

  for (var item in media) {
    if (item is Map<String, dynamic> && item.containsKey('media-metadata')) {
      var mediaMetadata = item['media-metadata'];
      if (mediaMetadata is List && mediaMetadata.isNotEmpty) {
        var firstMetadata = mediaMetadata.first;
        if (firstMetadata is Map<String, dynamic> &&
            firstMetadata.containsKey('url')) {
          return [firstMetadata['url'] as String];
        }
      }
    }
  }

  return [];
}
