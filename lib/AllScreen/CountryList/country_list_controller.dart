// ignore_for_file: avoid_print, unnecessary_null_comparison, avoid_function_literals_in_foreach_calls, invalid_use_of_protected_member

import 'dart:convert';

import 'package:get/get.dart';
import 'package:news_app/Database/app_data.dart';
import 'package:news_app/Database/data_model.dart';
import 'package:news_app/Helper/preferances.dart';

class CountryController extends GetxController {
  RxList<CountryDataModel> countryData = <CountryDataModel>[].obs;
  final prefs = Preference.preference;
  RxList<NewsDataModel> favouriteNewslist = <NewsDataModel>[].obs;
  @override
  void onInit() {
    super.onInit();

    creatdatabase();
    countryData.listen((p0) {
      print("called this ");
      p0.forEach((element) {
        favouriteNewslist.value.addAll(
            element.newsList!.where((element) => element.isFavourit!).toList());
      });
      favouriteNewslist.value = favouriteNewslist.value.toSet().toList();
      print("newslist ${favouriteNewslist.length}");
    });
  }

  Future<void> creatdatabase() async {
    if (await prefs.getString(PreferenceKey.database) == null) {
      var list = DataBase().countryNewsList;
      var database = jsonEncode(list);
      await prefs.saveString(PreferenceKey.database, database);
    }
    var data = await prefs.getString(PreferenceKey.database);
    print(data);
    var jsondata = jsonDecode(data!);
    for (var country in jsondata) {
      countryData.add(CountryDataModel.fromJson(country));
    }
    print("------------${countryData.length}");
  }

  getfavouriteList() {}
}
