import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class FilesData extends StatefulWidget {
  const FilesData({Key? key}) : super(key: key);

  @override
  _FilesDataState createState() => _FilesDataState();
}

class _FilesDataState extends State<FilesData> {
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

  String? name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ElevatedButton(
                  onPressed: () async {
                    FilePickerResult? result = await FilePicker.platform
                        .pickFiles(allowMultiple: true);
                    if (result != null) {
                      File file = File(result.files.single.path!);

                      PlatformFile fileData = result.files.first;

                      name = fileData.bytes.toString();

                      loadVideoPlayer(file);

                      setState(() {});
                    } else {
                      // User canceled the picker
                    }
                  },
                  child: const Text('File')),
              Text(name.toString()),
              if (_videoPlayerController != null)
                AspectRatio(
                    aspectRatio: _videoPlayerController!.value.aspectRatio,
                    child: VideoPlayer(_videoPlayerController!)),
              Image.file(File(''), filterQuality: FilterQuality.high),
              ElevatedButton(
                  onPressed: () {
                    _videoPlayerController!.play();
                    setState(() {});
                  },
                  child: const Text('Play'))
            ],
          ),
        ),
      ),
    );
  }
}
