import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:video_player/video_player.dart';
import 'item_video.dart';

class SliderPicture extends StatefulWidget {
  const SliderPicture({super.key});

  @override
  State<SliderPicture> createState() => _SliderPictureState();
}

class _SliderPictureState extends State<SliderPicture> {
  List<ItemModel> videoList = [];
  List<VideoPlayerController> videoPlayerControllerList = [];

  CarouselSliderController controller = CarouselSliderController();

  @override
  void initState() {
    super.initState();
    videoList.add(ItemModel(videoPath: 'assets/video/purpleglo.mp4'));
    videoList.add(ItemModel(videoPath: 'assets/video/purpleglo.mp4'));
    videoList.add(ItemModel(videoPath: 'assets/video/purpleglo.mp4'));
    videoList.add(ItemModel(videoPath: 'assets/video/purpleglo.mp4'));
    videoList.add(ItemModel(videoPath: 'assets/video/purpleglo.mp4'));
    videoList.add(ItemModel(videoPath: 'assets/video/purpleglo.mp4'));
    videoList.add(ItemModel(videoPath: 'assets/video/purpleglo.mp4'));
    videoList.add(ItemModel(videoPath: 'assets/video/videopro.mp4'));

    /// video initialize before create model
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: CarouselSlider.builder(
            itemCount: videoList.length,
            itemBuilder: (context, index, realIndex) {
              return ItemVideo(itemModel: videoList[index]);
            },
            carouselController: controller,
            options: CarouselOptions(
                height: 0.7.sh,
                initialPage: 0,
                // aspectRatio: 16 / 5,
                viewportFraction: 0.7,
                enlargeCenterPage: true,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
                enlargeFactor: 0.35),
          ),
        ),
        Align(alignment: Alignment.centerRight, child: Container(height: 0.7.sh, width: 0.1.sw, color: Colors.transparent)),
        Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
                onTap: () {
                  controller.previousPage(duration: const Duration(milliseconds: 200), curve: Curves.easeIn);
                },
                child: SvgPicture.asset('assets/icons/right.svg', color: Colors.white, height: 20.sp, width: 20.sp))),
        Align(alignment: Alignment.centerLeft, child: Container(height: 0.7.sh, width: 0.1.sw, color: Colors.transparent)),
        Align(
            alignment: Alignment.centerLeft,
            child: GestureDetector(
                onTap: () {
                  controller.nextPage(duration: const Duration(milliseconds: 200));
                },
                child: SvgPicture.asset('assets/icons/left.svg', color: Colors.white, height: 20.sp, width: 20.sp)))
      ],
    );
  }
}
