import 'dart:io';

import 'package:flutter_chat_app/constants.dart';
import 'package:flutter_chat_app/models/channel_info.dart';
import 'package:flutter_chat_app/models/videos_list.dart';
import 'package:flutter_chat_app/util/config.dart';
//import 'package:flutter_demos/models/viideos_list.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';


class Services {
  //
  static const channelID = channelIDFarming;
  static const _baseUrl = 'www.googleapis.com';

  static Future<ChannelInfo> getChannelInfo() async {
    Map<String, String> parameters = {
      'part': 'snippet,contentDetails,statistics',
      'id': channelID,
      'key': youtubeAPI,
    };
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };
    Uri uri = Uri.https(
      _baseUrl,
      '/youtube/v3/channels',
      parameters,
    );
    Response response = await http.get(uri, headers: headers);
    // print(response.body);
    ChannelInfo channelInfo = channelInfoFromJson(response.body);
    return channelInfo;
  }

  static Future<VideosList> getVideosList(
      {String playListId='', String pageToken = ''}) async {
    Map<String, String> parameters = {
      'part': 'snippet',
      'playlistId': playListId,
      'maxResults': '8',
      'pageToken': pageToken,
      'key': youtubeAPI,
    };
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };
    Uri uri = Uri.https(
      _baseUrl,
      '/youtube/v3/playlistItems',
      parameters,
    );
    Response response = await http.get(uri, headers: headers);
    // print(response.body);
    VideosList videosList = videosListFromJson(response.body);
    return videosList;
  }
}
