import 'package:json_annotation/json_annotation.dart';

part 'hot_and_new_resp.g.dart';

@JsonSerializable()
class HotAndNewResp {

  @JsonKey(name: 'page')
  int? page;
  List<HotAndNewData>? results;

  HotAndNewResp({this.page, this.results = const []});

  factory HotAndNewResp.fromJson(Map<String, dynamic> json) {
    return _$HotAndNewRespFromJson(json);
  }

  Map<String, dynamic> toJson() => _$HotAndNewRespToJson(this);
}

@JsonSerializable()
class HotAndNewData {
  @JsonKey(name: 'backdrop_path')
  String? backdropPath;

  @JsonKey(name: 'release_date')
  String? firstAirDate;

  @JsonKey(name: 'id')
  int? id;
  String? name;

  @JsonKey(name: 'original_language')
  String? originalLanguage;

  @JsonKey(name: 'original_title')
  String? originalTitle;
// in case of tv series , use orginal name intested of orginal title
  @JsonKey(name: 'original_name')
  String? originalName;
 

  String? overview;
  
  @JsonKey(name: 'poster_path')
  String? posterPath;
  
  

  HotAndNewData({
    this.backdropPath,
    this.firstAirDate,
    this.id,
    this.name,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.posterPath,
    
  });

  factory HotAndNewData.fromJson(Map<String, dynamic> json) {
    return _$HotAndNewDataFromJson(json);
  }

  Map<String, dynamic> toJson() => _$HotAndNewDataToJson(this);
}
