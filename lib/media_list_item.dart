import 'package:flutter/material.dart';
import 'package:appvideo/model/Media.dart';

class MediaListItem extends StatelessWidget {
  final Media media;
  MediaListItem(this.media);
  @override
  Widget build(BuildContext context) {
    return new Card(
      child: new Column(
        children: <Widget>[
          new FadeInImage.assetNetwork(
              placeholder: "assets/placeholder.jpg",
              image: media.getBackDropUrl())
        ],
      ),
    );
  }
}
