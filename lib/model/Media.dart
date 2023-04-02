import 'package:appvideo/comoon/util.dart';

class Media {
  int id;
  double voteAverage;
  String title;
  String posterPath;
  String backdropPath;
  String overView;
  String releaseDate;
  List<dynamic> genreIds;

  String getPosterUrl() => getMediumPictureUrl(posterPath);
  String getBackDropUrl() => getLargePictureUrl(backdropPath);

  factory Media(Map jsonMap) {
    try {
      return new Media.deserialize(jsonMap);
    } catch (ex) {
      throw ex;
    }
  }

  Media.deserialize(Map json)
      : id = json["id"].toInt(),
        voteAverage = json["vote_average"].toDouble(),
        title = json["title"],
        posterPath = json["poster_path"] ?? "",
        backdropPath = json["backdro_path"] ?? "",
        overView = json["overview"],
        releaseDate = json["release_data"],
        genreIds = json["genre_ids"].toList();
}
