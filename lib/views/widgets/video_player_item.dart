
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';

class VideoPlayerItem extends StatefulWidget {

  final String videoUrl;

  const VideoPlayerItem({Key? key, required this.videoUrl}) : super(key: key);

  @override
  State<VideoPlayerItem> createState() => _VideoPlayerItemState();
}

class _VideoPlayerItemState extends State<VideoPlayerItem> {

  late VideoPlayerController videoPlayerController;

  bool _isPlaying = false;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    videoPlayerController = VideoPlayerController.network(widget.videoUrl)..initialize().then((value){

      setState(() {
        videoPlayerController.play();
        videoPlayerController.setVolume(1);
        _isPlaying = true;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    videoPlayerController.dispose();
    super.dispose();
  }


  void _toggleVideoPlayback() {
    setState(() {
      if (_isPlaying) {
        videoPlayerController.pause();
      } else {
        videoPlayerController.play();
      }
      _isPlaying = !_isPlaying;
    });
  }

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: _toggleVideoPlayback,
      child: Container(
        width: size.width,
        height: size.height,
        decoration: const BoxDecoration(
          color: Colors.black,
        ),
        child: VideoPlayer(
            videoPlayerController
        ),
      ),
    );
  }
}

