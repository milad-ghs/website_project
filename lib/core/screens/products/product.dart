import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:website/core/utils/hover.dart';
import 'package:website/core/screens/item_we_do.dart';
import 'package:website/core/screens/products/moreproject.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Products extends StatefulWidget {
  const Products({super.key});

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this, duration: const Duration(seconds: 5));
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Container(
          decoration: const BoxDecoration(
            // border: Border.all(width: 0, color: Colors.transparent),
            color: Color.fromRGBO(6, 1, 27, 1.0),
            gradient: LinearGradient(begin: Alignment.topRight, end: Alignment.bottomLeft, colors: [Color.fromRGBO(6, 1, 27, 1.0), Color.fromRGBO(40, 6, 106, 1.0), Color.fromRGBO(56, 35, 97, 1.0)]),
          ),
          height: 1.3.sh,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(padding: const EdgeInsets.only(top: 160.0), child: Text(AppLocalizations.of(context)!.what, style: TextStyle(color: Colors.white, fontSize: 10.5.sp, fontWeight: FontWeight.w700))),
              const SizedBox(height: 70.0),
              Wrap(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(children: [
                        ItemWeDo(
                          h1: 0.26.sh,
                          h2: 0.3.sh,
                          text: "Multi Touch",
                          w1: 0.13.sw,
                          w2: 0.17.sw,
                          modelList: ModelList(imagePath: 'assets/images/image.jpg', videoAsset: 'assets/video/videopro.mp4'),
                        ),
                        SizedBox(height: 1.3.sp),
                        ItemWeDo(
                          h1: 0.17.sh,
                          h2: 0.2.sh,
                          text: "Hologram",
                          w1: 0.13.sw,
                          w2: 0.16.sw,
                          modelList: ModelList(imagePath: 'assets/images/pic.jpg', videoAsset: 'assets/video/purpleglo.mp4'),
                        )
                      ]),
                      Padding(
                        padding: EdgeInsets.only(left: 1.3.sp),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                ItemWeDo(
                                  h1: 0.13.sh,
                                  h2: 0.17.sh,
                                  text: "Projection Mapping",
                                  w1: 0.15.sw,
                                  w2: 0.19.sw,
                                  modelList: ModelList(imagePath: 'assets/images/image.jpg', videoAsset: 'assets/video/purpleglo.mp4'),
                                ),
                                SizedBox(width: 1.3.sp),
                                ItemWeDo(
                                  h1: 0.13.sh,
                                  h2: 0.17.sh,
                                  text: "Photo Experience",
                                  w1: 0.14.sw,
                                  w2: 0.18.sw,
                                  modelList: ModelList(imagePath: 'assets/images/image.jpg', videoAsset: 'assets/video/purpleglo.mp4'),
                                ),
                                SizedBox(width: 1.3.sp),
                                ItemWeDo(
                                  h1: 0.13.sh,
                                  h2: 0.17.sh,
                                  text: "VR",
                                  w1: 0.204.sw,
                                  w2: 0.244.sw,
                                  modelList: ModelList(imagePath: 'assets/images/ss.jpg', videoAsset: 'assets/video/videopro.mp4'),
                                )
                              ],
                            ),
                            SizedBox(height: 1.3.sp),
                            Row(
                              children: [
                                ItemWeDo(
                                  h1: 0.3.sh,
                                  h2: 0.34.sh,
                                  text: "Interactive Installations",
                                  w1: 0.19.sw,
                                  w2: 0.23.sw,
                                  modelList: ModelList(imagePath: 'assets/images/pic.jpg', videoAsset: 'assets/video/purpleglo.mp4'),
                                ),
                                SizedBox(width: 1.3.sp),
                                ItemWeDo(
                                  h1: 0.3.sh,
                                  h2: 0.35.sh,
                                  text: "Games",
                                  w1: 0.10.sw,
                                  w2: 0.15.sw,
                                  modelList: ModelList(imagePath: 'assets/images/image.jpg', videoAsset: 'assets/video/purpleglo.mp4'),
                                ),
                                SizedBox(width: 1.3.sp),
                                ItemWeDo(
                                  h1: 0.3.sh,
                                  h2: 0.35.sh,
                                  text: "AR",
                                  w1: 0.10.sw,
                                  w2: 0.15.sw,
                                  modelList: ModelList(imagePath: 'assets/images/pic.jpg', videoAsset: 'assets/video/purpleglo.mp4'),
                                ),
                                SizedBox(width: 1.3.sp),
                                ItemWeDo(
                                  h1: 0.3.sh,
                                  h2: 0.35.sh,
                                  text: "Animations",
                                  w1: 0.10.sw,
                                  w2: 0.15.sw,
                                  modelList: ModelList(imagePath: 'assets/images/image.jpg', videoAsset: 'assets/video/purpleglo.mp4'),
                                )
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10.sp),
              HoverBuilder(builder: (isHovered) {
                return Container(
                  decoration: BoxDecoration(border: Border.all(color: Colors.white, width: 1.5), borderRadius: BorderRadius.circular(34.5)),
                  height: 10.sp,
                  width: 36.sp,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const MoreProject()));
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: isHovered ? Colors.white : const Color.fromRGBO(56, 75, 112, 1)),
                    child: Text(
                      AppLocalizations.of(context)!.explore,
                      style: TextStyle(color: isHovered ? const Color.fromRGBO(56, 75, 112, 1) : Colors.white, fontSize: 4.sp, fontWeight: FontWeight.w300),
                    ),
                  ),
                );
              })
            ],
          )),
    );
  }
}
