class CountryDataModel {
  String? countryName;
  String? countryFlag;
  int? countryId;
  List<NewsDataModel>? newsList;
  CountryDataModel(
      {this.countryName, this.countryFlag, this.newsList, this.countryId});
  factory CountryDataModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      CountryDataModel(
        countryName: json["countryName"],
        countryFlag: json["countryFlag"],
        countryId: json["countryId"],
        newsList: List<NewsDataModel>.from(
            json["newsList"].map((x) => NewsDataModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'countryName': countryName,
        'countryFlag': countryFlag,
        'countryId': countryId,
        'newsList': List<dynamic>.from(newsList!.map((e) => e.toJson()))
      };
}

class NewsDataModel {
  String? newsName;
  String? newsImage;
  String? newsUrl;
  int? newsId;
  int? countryId;
  bool? isFavourit = false;
  NewsDataModel(
      {this.newsName,
      this.newsImage,
      this.newsUrl,
      this.isFavourit,
      this.newsId,
      this.countryId});
  factory NewsDataModel.fromJson(Map<String, dynamic> json) => NewsDataModel(
      newsName: json["newsName"],
      newsImage: json["newsImage"],
      newsUrl: json["newsUrl"],
      newsId: json["newsId"],
      countryId: json["countryId"],
      isFavourit: json["isFavourit"] ?? false);

  Map<String, dynamic> toJson() => {
        'newsName': newsName,
        'newsImage': newsImage,
        'newsUrl': newsUrl,
        'isFavourit': isFavourit,
        'newsId': newsId,
        'countryId': countryId,
      };
}
