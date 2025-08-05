import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:website/core/models/product_model.dart';

import '../../utils/hover.dart';

class MoreProject extends StatefulWidget {
  const MoreProject({super.key});

  @override
  State<MoreProject> createState() => _MoreProjectState();
}

class _MoreProjectState extends State<MoreProject> {
  final ScrollController _controller = ScrollController();
  List<ProductModel> listProduct = [];
  List<ProductDataModel> allList = [];
  bool showAll = false;
  int myIndex = 2;
  FixedExtentScrollController wheelController = FixedExtentScrollController(initialItem: 2);

  @override
  void initState() {
    super.initState();
    listProduct.add(ProductModel(id: 0, category: "Game", listProductData: [
      ProductDataModel(imagePath: 'assets/images/pic.jpg', title: "sd"),
      ProductDataModel(imagePath: 'assets/images/amoozesh.jpg', title: "sw"),
      ProductDataModel(imagePath: 'assets/images/namayesh.jpg', title: "Interactive Book Projection"),
      ProductDataModel(imagePath: 'assets/images/namayesh.jpg', title: "sz")
    ]));

    listProduct.add(ProductModel(id: 1, category: "Animation", listProductData: [ProductDataModel(imagePath: 'assets/images/pic.jpg', title: "sa"), ProductDataModel(imagePath: 'assets/images/amoozesh.jpg', title: "sq")]));
    listProduct.add(
      ProductModel(
        id: 2,
        category: "speed",
        listProductData: [ProductDataModel(imagePath: 'assets/images/pic.jpg', title: "sh"), ProductDataModel(imagePath: 'assets/images/amoozesh.jpg', title: "sg"), ProductDataModel(imagePath: 'assets/images/namayesh.jpg', title: "sn")],
      ),
    );

    listProduct.add(
      ProductModel(
        id: 3,
        category: "wall lcd",
        listProductData: [ProductDataModel(imagePath: 'assets/images/pic.jpg', title: "sh"), ProductDataModel(imagePath: 'assets/images/amoozesh.jpg', title: "sg"), ProductDataModel(imagePath: 'assets/images/namayesh.jpg', title: "sn")],
      ),
    );

    listProduct.add(
      ProductModel(
        id: 4,
        category: "mersad",
        listProductData: [ProductDataModel(imagePath: 'assets/images/pic.jpg', title: "sh"), ProductDataModel(imagePath: 'assets/images/amoozesh.jpg', title: "sg"), ProductDataModel(imagePath: 'assets/images/namayesh.jpg', title: "sn")],
      ),
    );

    listProduct.add(
      ProductModel(
        id: 5,
        category: "volleyball",
        listProductData: [ProductDataModel(imagePath: 'assets/images/pic.jpg', title: "sh"), ProductDataModel(imagePath: 'assets/images/amoozesh.jpg', title: "sg"), ProductDataModel(imagePath: 'assets/images/namayesh.jpg', title: "sn")],
      ),
    );

    for (int i = 0; i < listProduct.length; i++) {
      for (int j = 0; j < listProduct[i].listProductData.length; j++) {
        allList.add(
          listProduct[i].listProductData[j],
        );
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          color: const Color.fromRGBO(56, 75, 112, 1),
          width: 1.sw,
          child: Padding(
            padding: const EdgeInsets.only( left: 110.0, bottom: 110.0, right: 110.0),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding:  EdgeInsets.only(top: 0.1.sh),
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.keyboard_arrow_left),
                        color: Colors.white,
                        iconSize: 14.sp),
                  ),
                ),
                Text("WHAT WE DO", style: TextStyle(color: const Color.fromRGBO(211, 210, 209, 1.0), fontSize: 11.sp, fontWeight: FontWeight.bold)),
                const SizedBox(height: 40),
                Column(
                  children: [
                    SizedBox(
                      child: HoverBuilder(builder: (isHovered) {
                        return Container(
                          decoration: BoxDecoration(border: Border.all(color: Colors.white, width: 1.5), borderRadius: BorderRadius.circular(34.5)),
                          height: 8.sp,
                          width: 26.sp,
                          child: ElevatedButton(
                            onPressed: () {
                              showAll = true;
                              setState(() {});
                            },
                            style: ElevatedButton.styleFrom(backgroundColor: isHovered ? Colors.white : const Color.fromRGBO(56, 75, 112, 1)),
                            child: Text("Show All", style: TextStyle(color: isHovered ? const Color.fromRGBO(56, 75, 112, 1) : Colors.white, fontSize: 3.8.sp, fontWeight: FontWeight.w300)),
                          ),
                        );
                      }),
                    )
                  ],
                ),
                const SizedBox(height: 10),
                Container(
                  height: 0.25.sh,
                  width: 0.5.sw,
                  // color: Colors.grey,
                  alignment: Alignment.center,
                  child: RotatedBox(
                    quarterTurns: 1,
                    child: ListWheelScrollView.useDelegate(
                      controller: wheelController,
                      itemExtent: 220,
                      clipBehavior: Clip.antiAlias,
                      diameterRatio: 2,
                      physics: const FixedExtentScrollPhysics(),
                      offAxisFraction: -0.2,
                      magnification: 2,
                      childDelegate: ListWheelChildBuilderDelegate(
                          childCount: listProduct.length,
                          builder: (context, index) {
                            return Stack(
                              fit: StackFit.expand,
                              children: [
                                RotatedBox(
                                    quarterTurns: -1,
                                    child: TextButton(
                                      onPressed: () {
                                        myIndex = index;
                                        showAll = false;
                                        wheelController.animateToItem(index, duration: const Duration(milliseconds: 300), curve: Curves.easeIn);

                                        setState(() {});
                                      },
                                      child: Text(
                                        listProduct[index].category,
                                        style: GoogleFonts.poppins(fontSize: 35, color: Colors.white),
                                      ),
                                    )),
                                if (index != myIndex || showAll == true)
                                  ClipRect(
                                    // <-- clips to the 200x200 [Container] below
                                    child: BackdropFilter(
                                      filter: ImageFilter.blur(
                                        sigmaX: 3.0,
                                        sigmaY: 3.0,
                                      ),
                                      child: Container(
                                        alignment: Alignment.center,
                                        width: 200.0,
                                        height: 200.0,
                                        child: const Text(''),
                                      ),
                                    ),
                                  ),
                              ],
                            );
                          }),
                    ),
                  ),
                ),
                showAll
                    ? Padding(
                        padding: EdgeInsets.symmetric(horizontal: 0.18.sw),
                        child: GridView(shrinkWrap: true, gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, crossAxisSpacing: 8, mainAxisSpacing: 8), children: [
                          for (int i = 0; i < allList.length; i++)
                            Container(
                              height: 0.5.sw,
                              width: 0.5.sw,
                              decoration: BoxDecoration(
                                image: DecorationImage(image: AssetImage(allList[i].imagePath), fit: BoxFit.cover, colorFilter: const ColorFilter.mode(Color.fromRGBO(90, 68, 227, 0.5), BlendMode.modulate)),
                              ),
                              alignment: Alignment.center,
                              child: Text(allList[i].title, textAlign: TextAlign.center, style: GoogleFonts.poppins(fontWeight: FontWeight.w600, color: Colors.white, fontSize: 25, letterSpacing: 1.2)),
                            )
                        ]),
                      )
                    : Padding(
                        padding: EdgeInsets.symmetric(horizontal: 0.18.sw),
                        child: GridView(
                          shrinkWrap: true,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, crossAxisSpacing: 8, mainAxisSpacing: 8),
                          children: [
                            for (int i = 0; i < listProduct[myIndex].listProductData.length; i++)
                              Container(
                                height: 0.9.sw,
                                width: 0.9.sw,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    image: DecorationImage(image: AssetImage(listProduct[myIndex].listProductData[i].imagePath), fit: BoxFit.cover, colorFilter: const ColorFilter.mode(Color.fromRGBO(90, 68, 227, 0.5), BlendMode.modulate))),
                                child: Directionality(
                                  textDirection: TextDirection.ltr,
                                  child: Text(
                                    listProduct[myIndex].listProductData[i].title,
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.poppins(fontWeight: FontWeight.w600, color: Colors.white, fontSize: 25, letterSpacing: 1.2),
                                  ),
                                ),
                              )
                          ],
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
