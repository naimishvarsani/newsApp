// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:news_app/Database/data_model.dart';
import 'package:news_app/Helper/utility.dart';

class DataBase {
  List<List> indiaNewsList = [
    ['dainikBhaskar.png', 'Dainik Bhasker', 'https://www.bhaskar.com/'],
    [
      'hindustantimes.png',
      'Hindustan times',
      'https://www.hindustantimes.com/'
    ],
    ['indianExpress.png', 'Indian Express', 'https://indianexpress.com/'],
    [
      'TheEconomicTimes.png',
      'Economic Times',
      'https://economictimes.indiatimes.com/'
    ],
    [
      'times of india.png',
      'Times of India',
      'https://timesofindia.indiatimes.com/'
    ],
    [
      'gujarat_samachar.png',
      'Gujrat Samachar',
      'https://www.gujaratsamachar.com/'
    ],
    ['punjabkesri.png', 'Punjab Kesari', 'https://www.punjabkesari.in/'],
    ['lokmat.png', 'LokMat', 'https://www.lokmat.com/'],
    ['dinamalar.png', 'DinaMalaar', 'https://www.dinamalar.com/'],
    ['ennadu.png', 'Ennadu', 'https://www.eenadu.net/'],
    ['mangalam.png', 'Mangalam', 'https://www.mangalam.com/'],
    ['kashmir.png', 'Greater Kashmir', 'https://www.greaterkashmir.com/'],
    ['ananda.png', 'Anandabazar Patrika', 'https://www.anandabazar.com/'],
  ];
  List<List> franceNewsList = [
    ['leFigaro.png', 'Le Figaro', 'https://www.lefigaro.fr/'],
    ['leMonde.png', 'Le Monde', 'https://www.lemonde.fr/'],
    ['lePerisian.png', 'Le Perisian', 'https://www.leparisien.fr/'],
    ['lequipe.png', 'Lequipe', 'https://www.lequipe.fr/'],
    ['liberation.png', 'Liberation', 'https://www.liberation.fr/'],
  ];
  List<List> usaNewsList = [
    ['USAtoday.png', 'USA Today', 'https://www.usatoday.com/'],
    ['WSJ.png', 'Wallstreet', 'https://www.wsj.com/'],
    ['NYpost.png', 'N.Y.Times', 'https://www.nytimes.com/international/'],
    ['deseretNews.png', 'Deseret News', 'https://www.deseret.com/'],
    ['cicagoTribune.png', 'Chicago Tribune', 'https://www.chicagotribune.com/'],
  ];
  List<List> ukNewsList = [
    [
      'dailymail.png',
      'Daily Mail',
      'https://www.dailymail.co.uk/news/index.html'
    ],
    ['metro.png', 'Metro', 'https://metro.co.uk/'],
    ['mirror.png', 'Mirror', 'https://www.mirror.co.uk/news/'],
    ['thesun.png', 'The Sun', 'https://www.thesun.co.uk/'],
    ['theTimes.png', 'The Times', 'https://www.thetimes.co.uk/'],
  ];
  List<List> spainNewsList = [
    ['abc_News.png', 'Daily Mail', 'https://abcnews.go.com/alerts/spain'],
    ['diariovasco.png', 'Metro', 'https://www.diariovasco.com/'],
    ['el_Mundo.png', 'Mirror', 'https://www.elmundo.es/'],
    ['el_Pais.png', 'The Sun', 'https://elpais.com/'],
    ['la_Vanguardia.png', 'The Times', 'https://www.lavanguardia.com/'],
  ];
  List<List> russiaNewsList = [
    ['argumentryFacty.png', 'Argumentry Facty', 'https://aif.ru/'],
    ['kommersant.png', 'Kommersant', 'https://www.kommersant.ru/'],
    ['komsomolskayaPravda.png', 'Komsomlskaya Pravda', 'https://www.kp.ru/'],
    [
      'theMoscowTimes.png',
      'The Moscow Times',
      'https://www.themoscowtimes.com/'
    ],
    ['trud.png', 'Trud', 'https://trud.bg/'],
  ];
  List<List> japanNewsList = [
    ['japannews.png', 'Yominuri Shimbun', 'https://www.yomiuri.co.jp/'],
    ['japantimes.png', 'Japan Times', 'https://www.japantimes.co.jp/'],
    ['japanToday.png', 'Japan Today', 'https://japantoday.com/'],
    ['nikkeiAsia.png', 'Nikkei Asia', 'https://asia.nikkei.com/'],
    ['theAsahiShimbun.png', 'Asahi Shimbun', 'https://www.asahi.com/ajw/'],
  ];
  List<List> italyNewsList = [
    ['avvenire.png', 'Avvenire', 'https://www.avvenire.it/'],
    [
      'corrireDellaSera.png',
      'Corriere Della Sera',
      'https://www.corriere.it/english/'
    ],
    ['Il_Gazzettino.png', ' Il Gazzettino', 'https://www.ilgazzettino.it/'],
    ['La_Repubblica.png', 'La republica', 'https://www.repubblica.it/'],
    ['la_stampa.png', 'La stampa', 'https://www.lastampa.it/'],
  ];
  List<List> germanyNewsList = [
    ['bild.png', 'Bild', 'https://www.bild.de/adblockwall.html'],
    ['D&W.png', 'Neys Devtschland', 'https://www.dw.com/en/top-stories/s-9097'],
    ['Die_Welt.png', 'Die Welt', 'https://www.welt.de/'],
    [
      'frankfurter_Allgemeine.png',
      'Frankfurter Allgemeine Zeitung',
      'https://www.faz.net/aktuell/'
    ],
    ['handelsbatt.png', 'Handlesbatt', 'https://www.handelsblatt.com/'],
  ];
  List<List> chinaNewsList = [
    ['chinaDaily.png', 'China Daily', 'https://www.chinadaily.com.cn/'],
    ['globalTimes.png', 'Global Times', 'https://www.globaltimes.cn/'],
    ['peoplesDaily.png', 'Peoples Daily', 'http://en.people.cn/'],
  ];

  late List<CountryDataModel> countryNewsList = [
    CountryDataModel.fromJson(country(
        'India',
        [
          for (int i = 0; i < indiaNewsList.length; i++)
            NewsDataModel.fromJson(
                newsDetails(indiaNewsList[i], AssetsPath.indianNews, i, 0))
        ],
        0)),
    CountryDataModel.fromJson(country(
        'France',
        [
          for (int i = 0; i < franceNewsList.length; i++)
            NewsDataModel.fromJson(
                newsDetails(franceNewsList[i], AssetsPath.franceNews, i, 1))
        ],
        1)),
    CountryDataModel.fromJson(country(
        'Usa',
        [
          for (int i = 0; i < usaNewsList.length; i++)
            NewsDataModel.fromJson(
                newsDetails(usaNewsList[i], AssetsPath.usaNews, i, 2))
        ],
        2)),
    CountryDataModel.fromJson(country(
        'Uk',
        [
          for (int i = 0; i < ukNewsList.length; i++)
            NewsDataModel.fromJson(
                newsDetails(ukNewsList[i], AssetsPath.ukNews, i, 3))
        ],
        3)),
    CountryDataModel.fromJson(country(
        'Spain',
        [
          for (int i = 0; i < spainNewsList.length; i++)
            NewsDataModel.fromJson(
                newsDetails(spainNewsList[i], AssetsPath.spainNews, i, 4))
        ],
        4)),
    CountryDataModel.fromJson(country(
        'Russia',
        [
          for (int i = 0; i < russiaNewsList.length; i++)
            NewsDataModel.fromJson(
                newsDetails(russiaNewsList[i], AssetsPath.russiaNews, i, 5))
        ],
        5)),
    CountryDataModel.fromJson(country(
        'Japan',
        [
          for (int i = 0; i < japanNewsList.length; i++)
            NewsDataModel.fromJson(
                newsDetails(japanNewsList[i], AssetsPath.japanNews, i, 6))
        ],
        6)),
    CountryDataModel.fromJson(country(
        'Italy',
        [
          for (int i = 0; i < italyNewsList.length; i++)
            NewsDataModel.fromJson(
                newsDetails(italyNewsList[i], AssetsPath.italyNews, i, 7))
        ],
        7)),
    CountryDataModel.fromJson(country(
        'Germany',
        [
          for (int i = 0; i < germanyNewsList.length; i++)
            NewsDataModel.fromJson(
                newsDetails(germanyNewsList[i], AssetsPath.germanNews, i, 8))
        ],
        8)),
    CountryDataModel.fromJson(country(
        'China',
        [
          for (int i = 0; i < chinaNewsList.length; i++)
            NewsDataModel.fromJson(
                newsDetails(chinaNewsList[i], AssetsPath.chinaNews, i, 9))
        ],
        9)),
  ];
  Map<String, dynamic> country(
      String name, List<NewsDataModel> newslist, int countryId) {
    return CountryDataModel(
            countryName: name,
            countryId: countryId,
            countryFlag: AssetsPath.flags + name.toLowerCase() + '.png',
            newsList: newslist)
        .toJson();
  }

  Map<String, dynamic> newsDetails(
      List news, String countrypath, int newsId, int countryId) {
    return NewsDataModel(
            newsImage: countrypath + news[0],
            newsId: newsId,
            countryId: countryId,
            newsName: news[1],
            newsUrl: news[2])
        .toJson();
  }
}
