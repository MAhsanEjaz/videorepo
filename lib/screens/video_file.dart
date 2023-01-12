import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  VideoPlayerController? _videoPlayerController;

  loadVideoPlayer(File file) {
    if (_videoPlayerController != null) {
      _videoPlayerController!.dispose();
    }
    // _videoPlayerController!.play();
    _videoPlayerController = VideoPlayerController.file(file,
        videoPlayerOptions: VideoPlayerOptions(
            allowBackgroundPlayback: true, mixWithOthers: true));
    _videoPlayerController!.initialize().then((value) {
      setState(() {});
    });
  }

  String? imagePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: selectVideo,
        child: const Icon(
          Icons.add,
        ),
      ),
      body: Center(
        child: Stack(
          children: [
            if (_videoPlayerController != null)
              AspectRatio(
                aspectRatio: _videoPlayerController!.value.aspectRatio,
                child: VideoPlayer(_videoPlayerController!),
              ),
            ElevatedButton(
                onPressed: () {
                  _videoPlayerController!.play();
                  setState(() {});
                },
                child: const Text('Play')),
            ElevatedButton(
                onPressed: () async {
                  final image =
                      await ImagePicker().pickImage(source: ImageSource.camera);

                  if (image != null) {
                    imagePath = image.path;
                    setState(() {});
                  }
                },
                child: Text(''))
          ],
        ),
      ),
    );
  }

  void selectVideo() async {
    final XFile? results =
        await ImagePicker().pickVideo(source: ImageSource.gallery);

    if (results != null) {
      setState(() {
        File file = File(results.path);
        loadVideoPlayer(file);
      });
    } else {
      print('No video picked');
    }
  }
}
