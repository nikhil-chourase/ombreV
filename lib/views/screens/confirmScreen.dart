


import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ombrev/controllers/upload_video_controller.dart';
import 'package:video_player/video_player.dart';


class ConfirmScreen extends StatefulWidget {
  final File videoFile;
  final String videoPath;
  const ConfirmScreen({
    Key? key,
    required this.videoFile,
    required this.videoPath,
  }) : super(key: key);



  @override
  State<ConfirmScreen> createState() => _ConfirmScreenState();
}
class _ConfirmScreenState extends State<ConfirmScreen> {
  late VideoPlayerController controller;








  UploadVideoController uploadVideoController =
  Get.put(UploadVideoController());



  @override
  void initState() {
    super.initState();
    setState(() {
      controller = VideoPlayerController.file(widget.videoFile as File);
    });
    controller.initialize();
    controller.play();
    controller.setVolume(1);
    controller.setLooping(true);
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 1.5,
              child: VideoPlayer(controller),
            ),
            const SizedBox(
              height: 30,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () => uploadVideoController.uploadVideo(widget.videoPath),

                      child: const Text(
                        'Share!',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
