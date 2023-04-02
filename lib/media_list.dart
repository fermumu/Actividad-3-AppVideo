import 'package:flutter/material.dart';
import 'package:appvideo/comoon/HttpHandler.dart';
import 'package:appvideo/model/Media.dart';
import 'package:appvideo/media_list_item.dart';

class MediaList extends StatefulWidget {
  MediaList({Key? key}) : super(key: key);

  @override
  State<MediaList> createState() => _MediaListState();
}

class _MediaListState extends State<MediaList> {
  final List<Media> _media = [];
  @override
  void initState() {
    super.initState();
    loadMovies();
  }

  void loadMovies() async {
    var httpHandler = HttpHandler();
    var movies = await httpHandler.fetchMovies();
    setState(() {
      _media.addAll(movies);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: new ListView.builder(
        itemCount: _media.length,
        itemBuilder: (BuildContext context, int index) {
          return new MediaListItem(_media[index]);
        },
      ),
    );
  }
}
