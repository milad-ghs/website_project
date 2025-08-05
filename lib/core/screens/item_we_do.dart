import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';
import '../utils/hover.dart';

class ItemWeDo extends StatefulWidget {
  ModelList modelList;
  String text;
  double h1;
  double h2;
  double w1;
  double w2;

  ItemWeDo({super.key, required this.text, required this.h1, required this.h2, required this.w1, required this.w2, required this.modelList});

  @override
  State<ItemWeDo> createState() => _ItemWeDoState();
}

class _ItemWeDoState extends State<ItemWeDo> {
  late VideoPlayerController _videoPlayerController;
  late Future<void> _initializeVideoPlayerFuture;
  bool isLoad = false;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.asset(widget.modelList.videoAsset);
    _initializeVideoPlayerFuture = _videoPlayerController.initialize();

    // _videoPlayerController.addListener(() {
    //   if (mounted) {
    //     setState(() {});
    //   }
    // });
    _videoPlayerController.setLooping(true);
    _videoPlayerController.setVolume(0.0);
    // _videoPlayerController.play();
  }

  // @override
  // void dispose() {
  //   // _videoPlayerController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return HoverBuilder(builder: (isHovered) {
      return AnimatedContainer(
        duration: Durations.long1,
        alignment: Alignment.center,
        height: isHovered ? widget.h2 : widget.h1,
        width: isHovered ? widget.w2 : widget.w1,
        onEnd: () {
          isLoad = isHovered ? true : false;
          setState(() {});
        },
        child: FutureBuilder(
          future: _initializeVideoPlayerFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (!_videoPlayerController.value.isPlaying) _videoPlayerController.play();

              return Stack(
                children: [
                  ClipRRect(
                    child: SizedBox.expand(
                      child: FittedBox(
                        alignment: Alignment.center,
                        fit: BoxFit.cover,
                        child: SizedBox(
                          height: _videoPlayerController.value.size.height,
                          width: _videoPlayerController.value.size.width,
                          child: VideoPlayer(_videoPlayerController),
                        ),
                      ),
                    ),
                  ),
                  AnimatedSwitcher(
                      key: UniqueKey(),
                      switchInCurve: Curves.easeInCubic,
                      switchOutCurve: Curves.easeInBack,
                      // duration: Durations.medium1,
                      duration: const Duration(seconds: 1000),
                      child:
                          // isHovered && !isLoad
                          //     ? Container(color: Colors.black)
                          //     :
                          isLoad
                              ? Container()
                              : Container(
                                  decoration: BoxDecoration(image: DecorationImage(image: AssetImage(widget.modelList.imagePath), fit: BoxFit.cover, colorFilter: ColorFilter.mode(Colors.purple.shade400, BlendMode.modulate))),
                                  alignment: Alignment.center,
                                  child: Text(widget.text, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 5.sp)))),
                ],
              );
            } else {
              return Container(
                  decoration: BoxDecoration(image: DecorationImage(image: AssetImage(widget.modelList.imagePath), fit: BoxFit.cover, colorFilter: ColorFilter.mode(Colors.purple.shade400, BlendMode.modulate))),
                  alignment: Alignment.center,
                  child: Text(widget.text, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 5.sp)));
            }
          },
        ),
      );
    });
  }
}

class ModelList {
  String imagePath;
  String videoAsset;

  ModelList({required this.imagePath, required this.videoAsset});
}
