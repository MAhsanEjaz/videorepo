import 'dart:io';
import 'package:cashintransect/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';
import 'package:vimeo_video_player/vimeo_video_player.dart';

class MainListScreen extends StatefulWidget {
  const MainListScreen({Key? key}) : super(key: key);

  @override
  _MainListScreenState createState() => _MainListScreenState();
}

class _MainListScreenState extends State<MainListScreen> {
  VideoPlayerController? _videoPlayerController;

  loadVideoPlayer(File file) {
    if (_videoPlayerController != null) {
      _videoPlayerController!.dispose();
    }
    // _videoPlayerController!.play();
    _videoPlayerController = VideoPlayerController.file(file,
        videoPlayerOptions: VideoPlayerOptions(
          allowBackgroundPlayback: true,
          mixWithOthers: true,
        ));
    _videoPlayerController!.initialize().then((value) {
      setState(() {});
    });
  }

  final imagePick = ImagePicker();
  String? imagePath;

  List<XFile> multiImage = [];

  File? videoFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, 'title', Colors.black, Colors.black54),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ElevatedButton(
                    onPressed: () async {
                      final image =
                          await imagePick.pickImage(source: ImageSource.camera);
                      if (image != null) {
                        imagePath = image.path;
                        setState(() {});
                      }
                    },
                    child: const Text('Select Image')),
                imagePath == null
                    ? const Text('No Image')
                    : Image.file(File(imagePath.toString())),
                ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: multiImage.length,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 500,
                        width: 100,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: FileImage(
                                    File(multiImage[index].path.toString())),
                                fit: BoxFit.cover)),
                      );
                    }),
                ElevatedButton(
                    onPressed: () async {
                      multiImage = (await imagePick.pickMultiImage());
                      setState(() {});
                    },
                    child: const Text('Multi Image')),
                ElevatedButton(
                    onPressed: () async {
                      XFile? video = await imagePick.pickVideo(
                          source: ImageSource.gallery);
                      if (video != null) {
                        videoFile = File(video.path);
                        loadVideoPlayer(videoFile!);
                        setState(() {});
                      }
                    },
                    child: const Text('Video')),
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
                VimeoVideoPlayer(
                  vimeoPlayerModel: VimeoPlayerModel(
                    url: videoFile.toString(),
                    systemUiOverlay: const [
                      SystemUiOverlay.top,
                      SystemUiOverlay.bottom,
                    ],
                  ),
                )
              ]),
        ),
      ),
    );
  }
}
