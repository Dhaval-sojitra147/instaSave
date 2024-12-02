import 'dart:convert';

import 'package:get/get.dart';
import 'package:instasave/Infrastructure/Commons/Constants/app_constants.dart';
class HashTagList {
  String? hashTagsData;
  bool selected = true;

  HashTagList({this.hashTagsData, this.selected=true});

  // static List hashtag = [];
  // static Future<List> loadData() async {
  //   var data = await rootBundle.loadString("assets/json/hashtag.json");
  //   print("^^^^^^^^${data}");
  //   hashtag = json.encode(data) as List<dynamic>;
  //   return hashtag;
  // }
}

class HashTagModel {
  String? hashTagName;
  RxBool onTap = false.obs;
  List<List<HashTagList>> hashtags = [];


  HashTagModel(
      {this.hashTagName, required this.onTap, this.hashtags = const []});
}

/// Hashtags Json *

Hashtag welcomeFromJson(String str) => Hashtag.fromJson(json.decode(str));

String welcomeToJson(Hashtag data) => json.encode(data.toJson());

class Hashtag {
  Hashtag({
     this.hashtag,
  });

  Hashtags? hashtag;

  factory Hashtag.fromJson(Map<String, dynamic> json) => Hashtag(
    hashtag: Hashtags.fromJson(json["hashtag"]),
  );

  Map<String, dynamic> toJson() => {
    "hashtag": hashtag!.toJson(),
  };
}

class Hashtags {
  Hashtags({
    this.love,
    this.instaGood,
    this.fashion,
    this.travel,
    this.fitness,
    this.wedding,
    this.food,
  });

  List<String>? love;
  List<String>? instaGood;
  List<String>? fashion;
  List<String>? travel;
  List<String>? fitness;
  List<String>? wedding;
  List<String>? food;

  factory Hashtags.fromJson(Map<String, dynamic> json) => Hashtags(
    love: List<String>.from(json["love"].map((x) => x)),
    instaGood: List<String>.from(json["instaGood"].map((x) => x)),
    fashion: List<String>.from(json["fashion"].map((x) => x)),
    travel: List<String>.from(json["travel"].map((x) => x)),
    fitness: List<String>.from(json["fitness"].map((x) => x)),
    wedding: List<String>.from(json["wedding"].map((x) => x)),
    food: List<String>.from(json["food"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "love": List<dynamic>.from(love!.map((x) => x)),
    "instaGood": List<dynamic>.from(instaGood!.map((x) => x)),
    "fashion": List<dynamic>.from(fashion!.map((x) => x)),
    "travel": List<dynamic>.from(travel!.map((x) => x)),
    "fitness": List<dynamic>.from(fitness!.map((x) => x)),
    "wedding": List<dynamic>.from(wedding!.map((x) => x)),
    "food": List<dynamic>.from(food!.map((x) => x)),
  };
}

List<HashTagModel> hashTagModel = [
  HashTagModel(hashTagName: AppConstants.love.tr, onTap: true.obs, hashtags: [
    [
      HashTagList(hashTagsData: 'memories'),
      HashTagList(hashTagsData: 'love'),
      HashTagList(hashTagsData: 'photography'),
      HashTagList(hashTagsData: 'instagood'),
      HashTagList(hashTagsData: 'friends'),
      HashTagList(hashTagsData: 'travel'),
      HashTagList(hashTagsData: 'photooftheday'),
      HashTagList(hashTagsData: 'throwback'),
      HashTagList(hashTagsData: 'instagram'),
      HashTagList(hashTagsData: 'life'),
      HashTagList(hashTagsData: 'happy'),
      HashTagList(hashTagsData: 'family'),
      HashTagList(hashTagsData: 'nature'),
      HashTagList(hashTagsData: 'fun'),
      HashTagList(hashTagsData: 'picoftheday'),
      HashTagList(hashTagsData: 'smile'),
      HashTagList(hashTagsData: 'summer'),
      HashTagList(hashTagsData: 'tbt'),
      HashTagList(hashTagsData: 'like'),
      HashTagList(hashTagsData: 's'),
      HashTagList(hashTagsData: 'friendship'),
      HashTagList(hashTagsData: 'follow'),
      HashTagList(hashTagsData: 'travelphotography'),
      HashTagList(hashTagsData: 'music'),
      HashTagList(hashTagsData: 'beautiful'),
      HashTagList(hashTagsData: 'art'),
      HashTagList(hashTagsData: 'me'),
      HashTagList(hashTagsData: 'happiness'),
      HashTagList(hashTagsData: 'goodtimes'),
    ]
  ]),
  HashTagModel(
      hashTagName: AppConstants.instaGood.tr,
      onTap: false.obs,
      hashtags: [
        [
          HashTagList(hashTagsData: 'memories'),
          HashTagList(hashTagsData: 'love'),
          HashTagList(hashTagsData: 'photography'),
          HashTagList(hashTagsData: 'instagood'),
          HashTagList(hashTagsData: 'friends'),
          HashTagList(hashTagsData: 'travel'),
          HashTagList(hashTagsData: 'photooftheday'),
          HashTagList(hashTagsData: 'beautiful'),
          HashTagList(hashTagsData: 'art'),
          HashTagList(hashTagsData: 'me'),
          HashTagList(hashTagsData: 'happiness'),
          HashTagList(hashTagsData: 'goodtimes'),
          HashTagList(hashTagsData: 'throwback'),
          HashTagList(hashTagsData: 'instagram'),
          HashTagList(hashTagsData: 'life'),
          HashTagList(hashTagsData: 'happy'),
          HashTagList(hashTagsData: 'music'),
          HashTagList(hashTagsData: 'beautiful'),
        ],
        [
          HashTagList(hashTagsData: 'love'),
          HashTagList(hashTagsData: 'photography'),
          HashTagList(hashTagsData: 'instagood'),
          HashTagList(hashTagsData: 'friends'),
          HashTagList(hashTagsData: 'travel'),
          HashTagList(hashTagsData: 'photooftheday'),
          HashTagList(hashTagsData: 'beautiful'),
          HashTagList(hashTagsData: 'art'),
          HashTagList(hashTagsData: 'me'),
          HashTagList(hashTagsData: 'happiness'),
          HashTagList(hashTagsData: 'goodtimes'),
          HashTagList(hashTagsData: 'throwback'),
          HashTagList(hashTagsData: 'instagram'),
          HashTagList(hashTagsData: 'life'),
          HashTagList(hashTagsData: 'happy'),
          HashTagList(hashTagsData: 'music'),
          HashTagList(hashTagsData: 'beautiful'),
          HashTagList(hashTagsData: 'memories'),
        ]
      ]),
  HashTagModel(
      hashTagName: AppConstants.fashion.tr,
      onTap: false.obs,
      hashtags: [
        [
          HashTagList(hashTagsData: 'memories'),
          HashTagList(hashTagsData: 'love'),
          HashTagList(hashTagsData: 'throwback'),
          HashTagList(hashTagsData: 'instagram'),
          HashTagList(hashTagsData: 'life'),
          HashTagList(hashTagsData: 'happy'),
          HashTagList(hashTagsData: 'music'),
          HashTagList(hashTagsData: 'beautiful'),
          HashTagList(hashTagsData: 'photography'),
          HashTagList(hashTagsData: 'instagood'),
          HashTagList(hashTagsData: 'friends'),
          HashTagList(hashTagsData: 'photooftheday'),
          HashTagList(hashTagsData: 'music'),
          HashTagList(hashTagsData: 'beautiful'),
          HashTagList(hashTagsData: 'art'),
          HashTagList(hashTagsData: 'me'),
          HashTagList(hashTagsData: 'happiness'),
          HashTagList(hashTagsData: 'goodtimes'),
          HashTagList(hashTagsData: 'travel'),
        ]
      ]),
  HashTagModel(
      hashTagName: AppConstants.travel.tr,
      onTap: false.obs,
      hashtags: [
        [
          HashTagList(hashTagsData: 'goodtimes'),
          HashTagList(hashTagsData: 'memories'),
          HashTagList(hashTagsData: 'throwback'),
          HashTagList(hashTagsData: 'instagram'),
          HashTagList(hashTagsData: 'life'),
          HashTagList(hashTagsData: 'happy'),
          HashTagList(hashTagsData: 'music'),
          HashTagList(hashTagsData: 'beautiful'),
          HashTagList(hashTagsData: 'love'),
          HashTagList(hashTagsData: 'photography'),
          HashTagList(hashTagsData: 'instagood'),
          HashTagList(hashTagsData: 'friends'),
          HashTagList(hashTagsData: 'travel'),
          HashTagList(hashTagsData: 'photooftheday'),
          HashTagList(hashTagsData: 'throwback'),
          HashTagList(hashTagsData: 'instagram'),
          HashTagList(hashTagsData: 'life'),
          HashTagList(hashTagsData: 'happy'),
          HashTagList(hashTagsData: 'family'),
          HashTagList(hashTagsData: 'happiness'),
        ]
      ]),
  HashTagModel(
      hashTagName: AppConstants.fitness.tr,
      onTap: false.obs,
      hashtags: [
        [
          HashTagList(hashTagsData: 'fun'),
          HashTagList(hashTagsData: 'picoftheday'),
          HashTagList(hashTagsData: 'smile'),
          HashTagList(hashTagsData: 'beautiful'),
          HashTagList(hashTagsData: 'summer'),
          HashTagList(hashTagsData: 'tbt'),
          HashTagList(hashTagsData: 'like'),
          HashTagList(hashTagsData: 's'),
          HashTagList(hashTagsData: 'friendship'),
          HashTagList(hashTagsData: 'follow'),
          HashTagList(hashTagsData: 'travelphotography'),
          HashTagList(hashTagsData: 'music'),
          HashTagList(hashTagsData: 'art'),
          HashTagList(hashTagsData: 'me'),
          HashTagList(hashTagsData: 'happiness'),
          HashTagList(hashTagsData: 'goodtimes'),
        ]
      ]),
  HashTagModel(
      hashTagName: AppConstants.wedding.tr,
      onTap: false.obs,
      hashtags: [
        [
          HashTagList(hashTagsData: 'love'),
          HashTagList(hashTagsData: 'photography'),
          HashTagList(hashTagsData: 'memories'),
          HashTagList(hashTagsData: 'friends'),
          HashTagList(hashTagsData: 'travel'),
          HashTagList(hashTagsData: 'photooftheday'),
          HashTagList(hashTagsData: 'throwback'),
          HashTagList(hashTagsData: 'instagram'),
          HashTagList(hashTagsData: 'life'),
          HashTagList(hashTagsData: 'instagood'),
          HashTagList(hashTagsData: 'happy'),
          HashTagList(hashTagsData: 'music'),
          HashTagList(hashTagsData: 'beautiful'),
          HashTagList(hashTagsData: 'art'),
          HashTagList(hashTagsData: 'me'),
          HashTagList(hashTagsData: 'happiness'),
          HashTagList(hashTagsData: 'goodtimes'),
        ]
      ]),
  HashTagModel(hashTagName: AppConstants.food.tr, onTap: false.obs, hashtags: [
    [
      HashTagList(hashTagsData: 'memories'),
      HashTagList(hashTagsData: 'life'),
      HashTagList(hashTagsData: 'happy'),
      HashTagList(hashTagsData: 'family'),
      HashTagList(hashTagsData: 'nature'),
      HashTagList(hashTagsData: 'fun'),
      HashTagList(hashTagsData: 'love'),
      HashTagList(hashTagsData: 'photography'),
      HashTagList(hashTagsData: 'instagood'),
      HashTagList(hashTagsData: 'friends'),
      HashTagList(hashTagsData: 'travel'),
      HashTagList(hashTagsData: 'photooftheday'),
      HashTagList(hashTagsData: 'throwback'),
      HashTagList(hashTagsData: 'instagram'),
      HashTagList(hashTagsData: 'life'),
      HashTagList(hashTagsData: 'happy'),
      HashTagList(hashTagsData: 'family'),
      HashTagList(hashTagsData: 'nature'),
      HashTagList(hashTagsData: 'fun'),
    ],
  ]),
];
