import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';
import '../../utils/hover.dart';


class ItemVideo extends StatefulWidget {
  ItemModel itemModel;

  ItemVideo({super.key, required this.itemModel});

  @override
  State<ItemVideo> createState() => _ItemVideoState();
}

class _ItemVideoState extends State<ItemVideo> {
  late VideoPlayerController _videoPlayerController;
  late Future<void> _initializeVideoPlayerFuture;
  bool isLoad = false;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.asset(widget.itemModel.videoPath);

    _initializeVideoPlayerFuture = _videoPlayerController.initialize();

    // _videoPlayerController.addListener(() {
    //   if (mounted) {
    //     setState(() {});
    //   }
    // });
    _videoPlayerController.setLooping(true);
    _videoPlayerController.setVolume(0.0);
  }


  @override
  Widget build(BuildContext context) {
    return HoverBuilder(builder: (isHovered) {
      return AnimatedContainer(
        duration: Durations.medium4,
        alignment: Alignment.center,
        height: isHovered ? 0.65.sh : 0.6.sh,
        width: isHovered ? 0.65.sw : 0.6.sw,
        onEnd: () {
          isLoad = isHovered ? true : false;
          setState(() {});
        },
        child: FutureBuilder(
          future: _initializeVideoPlayerFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              isHovered
                  ? !_videoPlayerController.value.isPlaying && isLoad
                      ? _videoPlayerController.play()
                      : null
                  : _videoPlayerController.value.isPlaying && !isLoad
                      ? _videoPlayerController.pause()
                      : null;
              return AnimatedSwitcher(
                  duration: Durations.long1,
                  child: ClipRRect(
                    child: SizedBox.expand(
                      child: FittedBox(
                        alignment: Alignment.center,
                        fit: BoxFit.cover,
                        child: SizedBox(
                          height: _videoPlayerController.value.size.height,
                          width: _videoPlayerController.value.size.width,
                          child: VideoPlayer(
                            _videoPlayerController,
                          ),
                        ),
                      ),
                    ),
                  ));
            } else {
              return Container();
            }
          },
        ),
      );
    });
  }
}

class ItemModel {
  String videoPath;

  ItemModel({required this.videoPath});
}
