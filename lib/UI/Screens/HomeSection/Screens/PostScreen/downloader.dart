import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http; // import http package for API calls

class FlutterInsta {
  String url = "https://www.instagram.com/";
  String? _followers, _following, _website, _bio, _imgUrl, _username,_storyUrl;
  // List of images from user feed
  List<String>? _feedImagesUrl;

  //Download reels video
  Future<Map<String, dynamic>> downloadReels(String link) async {
    var linkEdit = link.replaceAll(" ", "").split("/");
    /*print('${linkEdit[0]}//${linkEdit[2]}/${linkEdit[3]}/${linkEdit[4]}' +
        "/?__a=1&__d=dis");*/

    var downloadURL = await http.get(Uri.parse(
        '${linkEdit[0]}//${linkEdit[2]}/${linkEdit[3]}/${linkEdit[4]}' +
            "/?__a=1&__d=dis"));
    if (downloadURL.statusCode == 200){
    var data = json.decode(downloadURL.body);
    if(!data.containsKey('status')) {
      var graphql = data['graphql'];
      var shortcodeMedia = graphql['shortcode_media'];
      var owner = shortcodeMedia['owner']['username'];
      var ownerProfilePic = shortcodeMedia['owner']['profile_pic_url'];
      var captionEdge = shortcodeMedia['edge_media_to_caption']['edges'];
      var caption = captionEdge.length != 0
          ?
          /// Promotional text
          ("${captionEdge[0]['node']['text']}")
          //("With @InstaSave by @$owner \n${captionEdge[0]['node']['text']}")
          : 'No Caption';
      String videoUrl = shortcodeMedia['video_url'];

      String thumbNail = shortcodeMedia['display_url'];
      var reelData = {'videoUrl': videoUrl, 'caption': caption, 'owner': owner,'thumbNail':[thumbNail],'ownerProfilePic':ownerProfilePic};
      return reelData;
    } // return download link
    else{
      var reelData = {
        "message": "Please wait a few minutes before trying again.",
        "require_login": true,
        "status": "fail"
      };
      return reelData;
    }
    }
    else{
      var reelData = {
        "message": "Don't paste private account link",
        "require_login": true,
        "status": "fail"
      };
      return reelData;
    }
  }

  //Download feed photo
  Future<Map<String, dynamic>> downloadPosts(String link) async {
    var linkEdit = link.replaceAll(" ", "").split("/");

      var downloadURL = await http.get(Uri.parse(
          '${linkEdit[0]}//${linkEdit[2]}/${linkEdit[3]}/${linkEdit[4]}' +
              "/?__a=1&__d=dis"));
     /* print('${linkEdit[0]}//${linkEdit[2]}/${linkEdit[3]}/${linkEdit[4]}' +
          "/?__a=1&__d=dis");*/
    if (downloadURL.statusCode == 200){
      var data = json.decode(downloadURL.body);
     // print(downloadURL.body);
      if (!data.containsKey('status')) {
        var graphql = data['graphql'];
        var shortcodeMedia = graphql['shortcode_media'];
        List<String> media = childFeed(shortcodeMedia)['media'];
        List<String> thumbnails = childFeed(shortcodeMedia)['thumbNails'];
        var photoUrl = shortcodeMedia['display_url'];
        //var isVideo = shortcodeMedia['is_video'];
        var owner = shortcodeMedia['owner']['username'];
        var ownerProfilePic = shortcodeMedia['owner']['profile_pic_url'];
        var captionEdge = shortcodeMedia['edge_media_to_caption']['edges'];
        var caption = captionEdge.length != 0
            ? ("${captionEdge[0]['node']['text']}")
            //("With @InstaSave by @$owner \n${captionEdge[0]['node']['text']}")
            : 'No Caption';
        var photoData = {
          'caption': caption,
          'owner': owner,
          'ownerProfilePic': ownerProfilePic,
          'PostUrl': !media.contains('isEmpty') ? media : <String>[photoUrl],
          'thumbnails':
              !thumbnails.contains('isEmpty') ? thumbnails : <String>[photoUrl],
        };
        return photoData; // return download link
      } else {
       // print(data);
        var reelData = {
          "message": "Please wait a few minutes before trying again.",
          "require_login": true,
          "status": "fail"
        };
        return reelData;
      }
    }
    else{
      var reelData = {
        "message": "Don't paste private account link",
        "require_login": true,
        "status": "fail"
      };
      return reelData;
    }
  }

  Map childFeed(var shortcodeMedia) {
    List<String> media = [];
    List<String> thumbNails = [];
    try{
      if(shortcodeMedia.containsKey('edge_sidecar_to_children')){
        var edgeChildren = shortcodeMedia['edge_sidecar_to_children'];
        var edges = edgeChildren['edges'];
        var photosLength = edges.length ?? 0;
        for (int i = 0; i < photosLength; i++) {
          var node = edges[i]['node'];//is_video
          var feedUrl= node.containsKey('video_url')?node['video_url']:node['display_url'];
          var thumbNail= node['display_url'];
          media.add(feedUrl);
          thumbNails.add(thumbNail);
        }
      }else{
        media = ['isEmpty'];
        thumbNails = ['isEmpty'];
      }
    }catch(e){
      if (kDebugMode) {
        print('error:- $e');
      }
    }

    Map childMedia={'media':media,'thumbNails':thumbNails};

    return childMedia;
  }

  //Download Story
  Future<Map<String, List<String?>>> downloadStories(String link) async {

    String storiesBaseLink='https://storiesig.info/api/ig/story?url';
    var downloadURL = await http.get(Uri.parse(
        '$storiesBaseLink=$link'));
    //print('$storiesBaseLink=$link');
    if (downloadURL.statusCode == 200){
    var data = json.decode(downloadURL.body);
    var result = data['result'];

    _storyUrl = result[0].containsKey('video_versions')? result[0]['video_versions'][0]['url'] : result[0]['image_versions2']['candidates'][0]['url'];
    String thumbNailUrl = result[0]['image_versions2']['candidates'][0]['url'];
    var storyData = {
      'mediaUrl': [_storyUrl],
      'thumbnailUrl': [thumbNailUrl],
    };

    return storyData;
    }
    else {
      var storyData = {
        "message": ["Don't paste private account link"],
        "require_login": ['true'],
        "status": ["fail"]
      };

      return storyData;
    }
  }

  //get profile details
  Future<void> getProfileData(String username) async {
    var res = await http.get(Uri.parse(Uri.encodeFull("$url$username/?__a=1&__d=dis")));
    var data = json.decode(res.body);
    if(!data.containsKey('status')){
      var graphql = data['graphql'];
      var user = graphql['user'];
      var biography = user['biography'];
      _bio = biography;
      var myFollowers = user['edge_followed_by'];
      var myFollowing = user['edge_follow'];
      _followers = myFollowers['count'].toString();
      _following = myFollowing['count'].toString();
      _website = user['external_url'];
      _imgUrl = user['profile_pic_url_hd'];
      _feedImagesUrl = user['edge_owner_to_timeline_media']['edges']
          .map<String>((image) => image['node']['display_url'] as String)
          .toList();
      _username = username;
    }else{
      print(data);
      _imgUrl = "";
    }

  }

  String? get followers => _followers; // number of followers of the user

  get following => _following; // number of following on the user

  get username => _username; // Username of the user

  get website => _website; // Link in the bio

  get bio => _bio; // Instagram bio of the user

  get imgUrl => _imgUrl; // Profile picture URL

  get storyUrl => _storyUrl; // Profile picture URL

  List<String>? get feedImagesUrl =>
      _feedImagesUrl; // List of URLs of feed images
}

