import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_chat_app/models/channel_info.dart';
import 'package:flutter_chat_app/models/videos_list.dart';
import 'package:flutter_chat_app/screens/video_player_screen.dart';
import 'package:flutter_chat_app/services/services_youtube_api.dart';
import 'package:flutter_chat_app/models/videos_list.dart' as videolistpage;


class VideoHomeScreen extends StatefulWidget {
  const VideoHomeScreen({super.key});

  static String id = "VidoHomeScreen";

  @override
  State<VideoHomeScreen> createState() => _VideoHomeScreenState();
}

class _VideoHomeScreenState extends State<VideoHomeScreen> {
  late ChannelInfo _channelInfo;
  late VideosList _videosList;
  late Item _item;
  late bool _loading;
  late String _playListId;
  late String _nextPageToken;
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _loading = true;
    _nextPageToken = '';
    _scrollController = ScrollController();
    _videosList = VideosList(
      "", // empty string for kind
      "", // empty string for etag
      "", // empty string for nextPageToken
      [], // Empty videos list
      videolistpage.PageInfo(resultsPerPage: 0, totalResults: 0), // Default pageInfo
    );
    _videosList.videos = [];
    _getChannelInfo();
  }

  _getChannelInfo() async {
    _channelInfo = await Services.getChannelInfo();
    _item = _channelInfo.items[0];
    _playListId = _item.contentDetails.relatedPlaylists.uploads;
    // print('_playListId $_playListId');
    await _loadVideos();
    setState(() {
      _loading = false;
    });
  }

  _loadVideos() async {
    VideosList tempVideosList = await Services.getVideosList(
      playListId: _playListId,
      pageToken: _nextPageToken,
    );
    _nextPageToken = tempVideosList.nextPageToken;

    _videosList.videos.addAll(tempVideosList.videos);
    //print('videos: ${_videosList.videos.length}');
    //print('_nextPageToken $_nextPageToken');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(_loading ? 'Loading...' : 'Farming tips and tricks on videos',
        style: const TextStyle(fontFamily: 'Pacifico'),),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            _buildInfoView(),
            Expanded(
              child: NotificationListener<ScrollEndNotification>(
                onNotification: (ScrollNotification notification) {
                  if (_videosList.videos.length >=
                      int.parse(_item.statistics.videoCount)) {
                    return true;
                  }
                  if (notification.metrics.pixels ==
                      notification.metrics.maxScrollExtent) {
                    _loadVideos();
                  }
                  return true;
                },
                child: ListView.builder(
                  controller: _scrollController,
                  itemCount: _videosList.videos.length,
                  itemBuilder: (context, index) {
                    VideoItem videoItem = _videosList.videos[index];
                    return InkWell(
                      onTap: () async {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return VideoPlayerScreen(
                            videoItem: videoItem,
                          );
                        }));
                      },
                      child: Container(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          children: [
                            CachedNetworkImage(
                              imageUrl: videoItem
                                  .video.thumbnails.thumbnailsDefault.url,
                            ),
                            const SizedBox(width: 20),
                            Flexible(child: Text(videoItem.video.title)),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildInfoView() {
    return _loading
        ? const CircularProgressIndicator()
        : Container(
            padding: const EdgeInsets.all(20.0),
            child: Card(
                child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: CachedNetworkImageProvider(
                      _item.snippet.thumbnails.medium.url,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Text(
                      _item.snippet.title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Text(_item.statistics.videoCount),
                  const SizedBox(width: 20),
                ],
              ),
            )),
          );
  }
}
